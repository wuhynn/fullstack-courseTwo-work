//Follow IEFE
(function (){
  'use strict';
  
  //Create Angular Module
  angular.module('LunchCheck', [])

  //Controller for handling textbox, the button, and the message placeholder
  .controller('LunchCheckController', LunchCheckController);

  LunchCheckController.$inject = ['$scope', '$filter', '$injector'];

  function LunchCheckController($scope, $filter, $injector){
    $scope.dishes = "";
    $scope.borderColor = "";
    $scope.colorChange = "black";

    $scope.checkDishes = function (){
      //Get the number of dishes and store it in an array using split()
      //comma as the delimiter
      var numOfDishes = $scope.dishes.split(",");
      //len for testing number of dishes
      var len = numOfDishes.length;
      //console.log(len);

      //Checks for space or empty string
      //Test condition $scope.dishes.length == 1
      if($scope.dishes == "" || $scope.dishes == " "){
        //Enter data message
        $scope.result = "Please enter data first";
        //console.log("Empty state");
        //Text and border color changes
        $scope.colorChange = "red";
        $scope.borderColor = "red";
      }

      //Check for less or equal to 3 items
      else if(len <= 3){
        //Enjoy Message
        $scope.result = "Enjoy!";
        //Text and border color changes
        $scope.colorChange = "green";
        $scope.borderColor = "green";
      }

      //Check for more than 3 items
      else if(len > 3){
        //Too much message
        $scope.result = "Too much!"
        //Text and border color changes
        $scope.colorChange = "green";
        $scope.borderColor = "green";
      }

    }

    //Annotate textbox, ubtton, placeholder
    console.log($injector.annotate(LunchCheckController));
  }


})();
