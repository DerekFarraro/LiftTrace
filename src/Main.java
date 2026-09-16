import java.util.ArrayList;
import java.util.Scanner;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);

        System.out.print("Enter workout name: ");
        String userWorkoutName = input.nextLine();

        Workout userWorkout = new Workout(userWorkoutName);

        while (true) {
            System.out.print("Enter exercise name: ");
            String exerciseName = input.nextLine(); //nextLine() for text

            //An object is created (the exercise)
            Exercise userExercise = new Exercise(exerciseName);

            while (true) {

                System.out.print("Enter the weight lifted: ");
                double userWeight = input.nextDouble();

                System.out.print("Enter the repetitions performed: ");
                int userRepetitions = input.nextInt();

                WorkoutSet userSet = new WorkoutSet(userWeight, userRepetitions);

                userExercise.addSet(userSet);

                System.out.print("Do you want to add more sets? (0 for NO, 1 for YES): ");
                int option = input.nextInt();

                if (option == 0) {
                    break;
                }
            }

            userWorkout.addExercise(userExercise);

            System.out.print("Do you want to add another exercise? (0 for NO, 1 for YES): ");
            int anotherExercise = input.nextInt();
            input.nextLine(); // Cleans the buffer of jump line

            if (anotherExercise == 0) {
                break; //
            }
        }
        System.out.println(userWorkout.calculateTotalWorkoutVolume());
    }
}