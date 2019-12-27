# Appbooster Library API documentation

## Аутентификация
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
    
    Клиент должен во все последующие запросы к API добавлять заголовок:
    
    Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJnb29nbGVfdWlkIjoiM...xdG60B84Ew-qf3jVGN9RHuGaNZAUDV70o55cgcyMWCc

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
                "page_count":640
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
            page_count: 272
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
            ...
        }
    }
