
New York Times Demo App
==============

This simple app to displaying the NY Times Most Popular Articles. Sample uses the most popular API of new york developer console.
User needs to select first sesction in which he is interested and then select duration , how far he/she want to see the article.
Taping on any article will display the details of article.

## Packaging

ViewController.swift
This is the welcome page of demo app.

OptionsListController.swift
Controller displaying the categoris of articles available

SubOptionsListController.swift
Controller displaying the time duration selction for particular article.

ArticleController.swift
This is a taleView controller which list all articles received from API response and displaying in table view cell with article title and image


NewYorkServiceLayer.swift
This class is reponsible for establishing connection for request/response from server using NSURLSession related classes and objects


Pods:
SDWebImage : Sdwebimage is used for caching images .


Design Pattern;
MVC design pattern is used in application. A Model(ArticleData.swift) is cretaed which defines  any particular article object.


## Build Requirements
+ iOS 11.0 SDK or later

## Runtime Requirements
+ iOS 10.0 or later






