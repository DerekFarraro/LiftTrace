public class WorkoutSet {
    private double weight;
    private int repetitions;

    public WorkoutSet(double weight, int repetitions){
        this.weight = weight;
        this.repetitions = repetitions;
    }

    public double calculateVolume(){
        return weight * repetitions;
    }

}
