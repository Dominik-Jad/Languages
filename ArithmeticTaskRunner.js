class ArithmeticTaskRunner {
  constructor() {
    this._tasks = []
    this.taskCount
  }
  get taskCount(){
    return this._tasks.length
  }
  addNegationTask(){
   this._tasks.push(x => -x)
  }
  addAdditionTask(y){
    this._tasks.push(x => x + y)
  }
  addMultiplicationTask(y){
    this._tasks.push(x => x * y)
  }
  execute(startValue = 0){
    var currentValue = startValue;
    for(const task of this._tasks){
      currentValue = task(currentValue)
    }
    return currentValue
  }
}
print = console.log

taskRunner = new ArithmeticTaskRunner()
/*
taskRunner.addAdditionTask(10)
taskRunner.addNegationTask()
taskRunner.addMultiplicationTask(0.5)
print(taskRunner.execute())
print(taskRunner.execute(10))
taskRunner.taskCount = 1
print(taskRunner.taskCount)
*/
taskRunner.addAdditionTask(2)
taskRunner.addMultiplicationTask(4)
taskRunner.addAdditionTask(10)
print(taskRunner.execute(2))
print(taskRunner.execute(-2))
taskRunner.taskCount = 5
print(taskRunner.taskCount)
