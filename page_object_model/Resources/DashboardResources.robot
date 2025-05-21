*** Settings ***
Documentation    Dashboard page resource for the website
Library    SeleniumLibrary

*** Variables ***
${dashboard_title}    css:.oxd-topbar-header-breadcrumb-module

*** Keywords ***
Verify Dashboard Page opens
    Element Text Should Be   ${dashboard_title}    Dashboard