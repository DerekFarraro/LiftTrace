import java.util.ArrayList;

public class Exercise {
    private String exerciseName;
    private ArrayList<WorkoutSet> exerciseSets;

    //The constructor only asks for the name
    public Exercise(String exerciseName){
        this.exerciseName = exerciseName;

        //The space is separated in memory (with "new") for the exercise
        this.exerciseSets = new ArrayList<WorkoutSet>();
    }

    public void addSet(WorkoutSet newSet){
        this.exerciseSets.add(newSet);
    }

    public String getExerciseName(){
        return this.exerciseName;
    }

    public ArrayList<WorkoutSet> getExerciseSets(){
        return this.exerciseSets;
    }

    public double calculateTotalVolume(){
        double progressiveSum = 0.0;

        for (WorkoutSet set : this.exerciseSets){
            progressiveSum += set.calculateVolume();
        }
        return progressiveSum;
    }

}
