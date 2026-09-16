import java.util.ArrayList;

public class Workout {
    private String workoutName;
    private ArrayList<Exercise> exerciseList;

    public Workout(String workoutName){
        this.workoutName = workoutName;

        this.exerciseList = new ArrayList<Exercise>();
    }

    public void addExercise(Exercise newExercise){
        this.exerciseList.add(newExercise);
    }

    public double calculateTotalWorkoutVolume(){
        double progressiveSum = 0.0;

        for(Exercise currentExercise : this.exerciseList){
            progressiveSum += currentExercise.calculateTotalVolume();
        }

        return progressiveSum;
    }

    public String getWorkoutName(){
        return this.workoutName;
    }

    public ArrayList<Exercise> getExerciseList(){
        return this.exerciseList;
    }


}
