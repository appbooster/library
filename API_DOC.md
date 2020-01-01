# Appbooster Library API documentation

## Аутентификация через Google (на сервере)
    Пользователи аутентифицируются со своим google-аккунтом в домене appbooster.ru
    При обращении к endpoint /auth/google_oauth2 происходит перенаправление на страницу логина в google, 
    а затем на /auth/google_oauth2/callback
    
    С коллбэком от Google приходит объект c даными пользователя и его идентификатором google_uid.
    Если пользователь с таким google_uid отсутствует в базе, создается новый, иначе возвращается существующий.
    
    Закодированный google_uid возвращается на клиент в виде JWT

    GET /auth/google_oauth2
    
    {
        "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJnb29nbGVfdWlkIjoiM...xdG60B84Ew-qf3jVGN9RHuGaNZAUDV70o55cgcyMWCc",
        "token_type": "Bearer",
        "expires_in": 604800 // 7 дней
    }

## Аутентификация через Google (на клиенте)
    Мобильный клиент самостоятельно получает от Google объект с информацией о пользователе и его google_uid
    и присылает на сервер в теле POST-запроса.
     
    POST http://library.appbooster.com/api/v1/login
    
    PARAMS
    {
        user: {
            email: "mail@appbooster.ru",
            google_uid: "1111",
            first_name: "Ivan",
            last_name: "Inanov",
            remote_avatar_url: "https://ololo.com/avatar.png"
        } 
    }
    
    RESPONSE
    {
        "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJnb29nbGVfdWlkIjoiM...xdG60B84Ew-qf3jVGN9RHuGaNZAUDV70o55cgcyMWCc",
        "token_type": "Bearer",
        "expires_in": 604800 // 7 дней
    }
    
    Клиент должен во все последующие запросы к API добавлять заголовок:
    
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJnb29nbGVfdWlkIjoiM...xdG60B84Ew-qf3jVGN9RHuGaNZAUDV70o55cgcyMWCc

## Профиль пользователя

    GET /api/v1/profile
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "profile": {
            "id": 2,
            "email": "selivanova@appbooster.ru",
            "full_name": "Selivanova Anna"
        }
    }

## Книги

### Получение списка книг

    GET /api/v1/books
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "books":[
            {
                "id": 1,
                "title": "Высоконагруженные приложения. Программирование, масштабирование, поддержка",
                "subtitle": "",
                "authors": "Мартин Клеппман",
                "publisher": "\"Издательский дом \"\"Питер\"\"\"",
                "description": "В этой книге вы найдете ключевые принципы, алгоритмы и компромиссы...",
                "cover_image": "http://books.google.com/books/content?id=ehpKDwAAQBAJ\u0026printsec=frontcover\u0026img=1\u0026zoom=1\u0026edge=curl\u0026source=gbs_api",
                "page_count": 640,
                "total_items_count": 2,
                "available_items_count": 1,
                "current_readers": [
                    {
                        "id": 2,
                        "email": "selivanova@appbooster.ru",
                        "full_name": "Selivanova Anna",
                        "read_since": "2019-12-29T14:09:17.592+04:00"
                    }
                ],
                "subscribers": [
                    {
                        "id": 2,
                        "email": "selivanova@appbooster.ru",
                        "full_name": "Selivanova Anna",
                        "subscribed_at": "2019-12-30T16:41:26.572+04:00"
                    }
                ],
                "reviews": [
                    {
                        "id": 2,
                        "body": "Great book!",
                        "created_at": "2019-12-30T10:35:19.397+04:00",
                        "author": {
                            "id": 2,
                            "email": "selivanova@appbooster.ru",
                            "full_name": "Selivanova Anna"
                        }
                    }
                ],
                "tags": [
                    {
                        "id": 1,
                        "name": "разработка"
                    },
                    ...
                ]
            },
            ...
        ]
    }
    
### Поиск книги по ее ISBN

    GET /api/v1/books/search
    
    PARAMS
    {
        isbn: 9785446105120
    }
    
    RESPONSE
    200 OK
    {
        "found": true,
        "result": {
            "title": "Высоконагруженные приложения. Программирование, масштабирование, поддержка",
            "subtitle": null,
            "authors": "Мартин Клеппман",
            "publisher": "\"Издательский дом \"\"Питер\"\"\"",
            "description": "В этой книге вы найдете ключевые принципы, алгоритмы и компромиссы...",
            "isbn_10": "5446105125",
            "isbn_13": "9785446105120",
            "cover_image": "http://books.google.com/books/content?id=ehpKDwAAQBAJ\u0026printsec=frontcover\u0026img=1\u0026zoom=1\u0026edge=curl\u0026source=gbs_api",
            "page_count": 640
        }
    }
    
    или, если книга не найдена:

    {
        "found": false
    }

### Добавление книги

    POST /api/v1/books
    
    PARAMS:
    {
        book: {
            title: "Первые 90 дней", // обязательный
            subtitle: "Стратегии успеха для новых лидеров всех уровней",
            authors: "Майкл Уоткинс", // обязательный
            publisher: "Манн, Иванов и Фербер",
            description: "Как показывает практика, самый рискованный период для любого менеджера на новой работе...",
            isbn_10: "5001006139",
            isbn_13: "9785001006138",
            cover_image: "http://books.google.com/books/content?id=9Fd2DgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
            page_count: 272,
            total_items_count: 1
        }
    }
    
    RESPONSE
    200 OK
    {
        "book": {
            "id": 2,
            "title": "Первые 90 дней",
            "subtitle": "Стратегии успеха для новых лидеров всех уровней",
            "authors": "Майкл Уоткинс",
            ...
        }
    }
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": {
            "title": [
                "Can't be blank"
            ]
        }
    }

### Получение информации о книге по ее id

    GET /api/v1/books/:id
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "book": {
            "id": 2,
            "title": "Первые 90 дней",
            "subtitle": "Стратегии успеха для новых лидеров всех уровней",
            "authors": "Майкл Уоткинс",
            "publisher": "Манн, Иванов и Фербер",
            "description": "Как показывает практика, самый рискованный период для любого менеджера на новой работе...",
            "isbn_10": "5001006139",
            "isbn_13": "9785001006138",
            "cover_image": "http://books.google.com/books/content?id=9Fd2DgAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api",
            "page_count": 272,
            "total_items_count": 2,
            "available_items_count": 1,
            "current_readers": [
                {
                    "id": 2,
                    "email": "selivanova@appbooster.ru",
                    "full_name": "Selivanova Anna",
                    "read_since": "2019-12-29T14:09:17.592+04:00"
                }
            ],
            "subscribers": [
                {
                    "id": 2,
                    "email": "selivanova@appbooster.ru",
                    "full_name": "Selivanova Anna",
                    "subscribed_at": "2019-12-30T16:41:26.572+04:00"
                }
            ],
            "reviews": [
                {
                    "id": 2,
                    "body": "Great book!",
                    "created_at": "2019-12-30T10:35:19.397+04:00",
                    "author": {
                        "id": 2,
                        "email": "selivanova@appbooster.ru",
                        "full_name": "Selivanova Anna"
                    }
                }
            ],
            "tags": [
                {
                    "id": 5,
                    "name": "управление"
                },
                ...
            ]
        }
    }

### Взять книгу

    POST /api/v1/books/:id/take
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "book": {                       // полный ответ см. в GET /api/v1/books/:id
            "id": 2,
            "title": "Первые 90 дней",
            ...
        }
    }
    
    Если все экземпляры заняты:
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": "No items available"
    }
    
    Если книга уже на руках и текущего пользователя:
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": "You already took this book"
    }


### Вернуть книгу

    POST /api/v1/books/:id/give_back
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "book": {                       // полный ответ см. в GET /api/v1/books/:id
            "id": 2,
            "title": "Первые 90 дней",
            ...
        }
    }
    
    Если запись о том, что юзер взял эту книгу, не найдена:
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": "You didn't take this book"
    }
    
### Подписаться на книгу (встать в очередь ожидания)
    
    POST /api/v1/books/:id/subscribe
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "book": {                       // полный ответ см. в GET /api/v1/books/:id
            "id": 2,
            "title": "Первые 90 дней",
            ...
        }
    }
    
    Если книга уже у текущего пользователя на руках:
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": "You currently reading this book"
    }
    
    Если пользователь уже подписан на книгу:
        
    422 UNPROCESSABLE ENTITY
    {
        "errors": "You already subscribed to this book"
    }
    
### Отменить подписку на книгу
    
    POST /api/v1/books/:id/unsubscribe
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "book": {                       // полный ответ см. в GET /api/v1/books/:id
            "id": 2,
            "title": "Первые 90 дней",
            ...
        }
    }
    
    Если подписка не найдена:
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": "You are not subscribed to this book"
    }

## Рецензии

### Создать рецензию

    POST /api/v1/books/:book_id/reviews
    
    PARAMS
    {
        book_id: 1,
        review: {
            body: "Great book!"
        }
    }

    RESPONSE
    200 OK
    {
        "review": {
            "id": 2,
            "body": "Great book!",
            "created_at": "2019-12-30T10:35:19.397+04:00",
            "author": {
                "id": 2,
                "email": "selivanova@appbooster.ru",
                "full_name": "Selivanova Anna"
            }
        }
    }
    
    или
    
    422 UNPROCESSABLE ENTITY
    {
        "errors": {
            "body": ["can't be blank"]
        }
    }

## Теги

### Список тегов
    
    GET /api/v1/tags/
    
    PARAMS
    NO
    
    RESPONSE
    200 OK
    {
        "tags": [
            {
                "id": 1,
                "name": "разработка"
            },
            {
                "id": 2,
                "name": "продукт"
            },
            ...
        ]
    }

### Добавить теги к книге

    POST /api/v1/books/:book_id/tags/add
    
    PARAMS
    {
        tags: [1, 13] // массив id тегов, которые нужно добавить
    }
    
    RESPONSE
    200 OK
    {
        "book": { ... } // полный ответ см. в GET /api/v1/books/:id
    }

### Удалить теги у книги

    POST /api/v1/books/:book_id/tags/remove
    
    PARAMS
    {
        tags: [1, 13] // массив id тегов, которые нужно удалить
    }
    
    RESPONSE
    200 OK
    {
        "book": { ... } // полный ответ см. в GET /api/v1/books/:id
    }
