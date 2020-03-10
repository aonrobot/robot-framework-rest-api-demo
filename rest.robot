*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  String
Library  HttpLibrary.HTTP

*** Variables ***
${url}  https://reqres.in/api

*** Keywords ***
Get_User_Profile
    Create Session  REQRESAPI    ${url}
    ${res}=     Get Request     REQRESAPI   /users/12
    Log Json    ${res.content}

*** Test Case ***
Get User Profile Success
    Get_User_Profile