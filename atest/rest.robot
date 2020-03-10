*** Settings ***
Library     REST    https://reqres.in/api

*** Variables ***
${url}  https://reqres.in/api

*** Keywords ***
Get_User_Profile
    [Arguments]    ${id}
    GET   /users/${id}

*** Test Case ***
Get User Profile Success
    Get_User_Profile    id=12
    Integer     response status     200
    Integer     $.data.id           12
    String      $.data.email        rachel.howell@reqres.in
    String      $.data.first_name   Rachel
    String      $.data.last_name    Howell
    String      $.data.avatar       https://s3.amazonaws.com/uifaces/faces/twitter/hebertialmeida/128.jpg

Get User Profile But User Not Found
    Get_User_Profile    id=123
    Integer     response status     404
    Object      response body       {}
    