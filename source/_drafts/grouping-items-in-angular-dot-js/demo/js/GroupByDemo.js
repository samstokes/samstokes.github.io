---
published: false
---
var app = angular.module('GroupByDemo', []);

app.controller('TasksCtrl', function TasksCtrl($scope) {
  $scope.tasks = [
    {day: 'Feb 27', title: 'Do some stuff'},
    {day: 'Feb 28', title: 'Some other stuff'},
    {day: 'Feb 27', title: 'Win the lottery'},
    {day: 'April 1', title: 'Find a greater fool'}
  ];
  $scope.newTask = {};

  $scope.addTask = function addTask() {
    this.tasks.push(this.newTask);
    this.newTask = {};
  };
});

app.filter('groupBy', function () {
  return function groupBy(items, field) {
    var grouped = _(items).groupBy(field);
    for (var key in grouped) {
      if (grouped.hasOwnProperty(key)) {
        grouped[key].$$hashKey = key;
      }
    }
    return grouped;
  };
});
