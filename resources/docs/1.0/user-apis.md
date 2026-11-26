# APIs de usuario

---
En esta sección se explicará como usar las diferentes APIs para los usuarios de la plataforma.

<a name="section-1"></a>
## Login API
### Endpoint
El endpoint al que tiene que hacer la petición POST es el siguiente: 

```php
http://localhost:8000/api/v1/user/login
```
### Login JSON 
Tiene que usar el siguiente formato en el JSON con el que realizará la petición:

```php
{
	"email":"user@example.com",
	"password":"user1234"
}
```
### Resultado de la petición
Si todo sale correctamente el resultado sera el siguiente:

```php
{
	"message": "Success Login",
	"access_token": "<access-token>"
}
```
El siguiente link lo redirigirá a una página donde se mostrará de manera más detallada como serian cada uno de los
posibles resultados de la API.

```php
http://localhost:8000/api/documentation
```
