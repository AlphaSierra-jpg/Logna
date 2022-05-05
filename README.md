
# Hello Welcome to ETNA Log


To start the API make sure you have docker installed.

When docker is installed, use this command to see all logs:
````
    docker-compose up 
````
And this one to mute the db logs:
````
    docker-compose up -d mongodb && docker-compose up serveur
````


## All the routes:

### Authentification:

``` 
    /auth

    JSON:
        login: your_login
        password: your_password
```

### Open attendance sheet:

```
    /createFeedData

    JSON:
        token: your_token
        promo: your_promo
        date: date_open_justification
```

### Justify a delay:

```
    /justification

    JSON:
        login: your_login
        dateTime: date_to_update
        isMorning: 1 or 0   
```

### Scan:

```
    /checkin
```

### Get the promo historical by date:

```
    /historyByDate/:idPromo/:date
```

### Get all the user historical:

```
    /historyByUser/:login
```

### Get the user historical of a day:

```
    /historyByUser/:login/:date
```
