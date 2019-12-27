# Appbooster Library API documentation

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
        "found":false
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
