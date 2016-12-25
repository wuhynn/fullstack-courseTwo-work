//Follow IEFE
(function (){
  'use strict';
  //Create Angular Module
  angular.module('LunchCheck', [])

  //Controller for handling textbox, the button, and
  //the message placeholder
  .controller('LunchCheckController', LunchCheckController);

  LunchCheckController.$inject = ['$scope', '$filter', '$injector'];

  function LunchCheckController($scope, $filter, $injector){

    $scope.checkDishes = function (){
      //Get the number of dishes and store it in an array using split()
      var numOfDishes = $scope.dishes.split(",");
      var len = numOfDishes.length;
      console.log(len);

      //Checks if "dishes" textbox is empty or filled
      if($scope.dishes == ""){
        $scope.result = "Please enter data first";
      }

      //Check for less or equal to 3 elements
      else if(len <= 3){
        $scope.result = "Enjoy!";
      }

      //Check for more 3
      else if(len > 3){
        $scope.result = "Too much!"
      }

      //else condition to change "result" variable to empty string
      else{
        $scope.result = "";
      }
    }

    //Annotate textbox, ubtton, placeholder
    console.log($injector.annotate(LunchCheckController));
  }


})();
