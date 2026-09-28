-- ========================================================
-- LiftTrace - Seed Data (Exercise Catalog)
-- Initial movement library across major muscle groups
-- ========================================================

-- Chest
INSERT INTO exercise_catalog (name, primary_muscle, secondary_muscles, equipment) VALUES
('Barbell Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Barbell'),
('Dumbbell Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Dumbbell'),
('Machine Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Machine'),
('Smith Machine Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Smith Machine'),
('Incline Barbell Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Barbell'),
('Incline Dumbbell Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Dumbbells'),
('Incline Machine Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Machine'),
('Incline Smith Machine Bench Press', 'Chest', 'Triceps, Anterior Deltoids', 'Smith Machine'),
('High to Low Cable Chest Fly', 'Chest', 'Anterior Deltoids', 'Cable'),
('Low to High Cable Chest Fly', 'Chest', 'Anterior Deltoids', 'Cable'),
('Mid Cable Chest Fly', 'Chest', 'Anterior Deltoids', 'Cable'),
('Pec Dec Fly', 'Chest', 'Anterior Deltoids', 'Machine'),
('Dips', 'Chest', 'Triceps, Anterior Deltoids', 'Bodyweight'),
('Machine Dips', 'Chest', 'Triceps, Anterior Deltoids', 'Machine'),

--Back
('Pull-Up', 'Back', 'Biceps, Forearms', 'Bodyweight'),
('Barbell Bent-Over Row', 'Back', 'Biceps, Rear Deltoids', 'Barbell'),
('Dumbbell Bent-Over Row', 'Back', 'Biceps, Rear Deltoids', 'Dumbbell'),
('Lat Pulldown', 'Back', 'Biceps', 'Cable'),
('Seated Close Grip Cable Row', 'Back', 'Biceps, Rear Deltoids', 'Cable'),
('Seated Wide Grip Cable Row', 'Back', 'Biceps, Rear Deltoids', 'Cable'),
('Barbell Shrugs', 'Traps', 'Foreamrs', 'Barbell'),
('Dumbbell Shrugs', 'Traps', 'Foreamrs', 'Dumbbell'),

-- Legs
('Barbell Back Squat', 'Quadriceps', 'Glutes, Lower Back', 'Barbell'),
('Dumbbell Squat', 'Quadriceps', 'Glutes, Lower Back', 'Dumbbells'),
('Smith Machine Back Squat', 'Quadriceps', 'Glutes, Lower Back', 'Smith Machine'),
('Barbell Deadlift', 'Hamstrings', 'Glutes, Back, Forearms', 'Barbell'),
('Dumbbell Deadlift', 'Hamstrings', 'Glutes, Back, Forearms', 'Dumbbells'),
('Smith Machine Deadlift', 'Hamstrings', 'Glutes, Back, Forearms', 'Smith Machine'),
('Barbell Romanian Deadlift', 'Hamstrings', 'Glutes, Lower Back', 'Barbell'),
('Smith Machine Romanian Deadlift', 'Hamstrings', 'Glutes, Lower Back', 'Smith Machine'),
('Leg Press', 'Quadriceps', 'Glutes', 'Machine'),
('Leg Extension', 'Quadriceps', NULL, 'Machine'),
('Lying Leg Curl', 'Hamstrings', 'Calves', 'Machine'),
('Seated Leg Curl', 'Hamstrings', 'Calves', 'Machine'),
('Standing Calf Raise', 'Calves', NULL, 'Machine'),
('Bodyweight Calf Raise', 'Calves', NULL, 'Bodyweight'),
('Seated Calf Raise', 'Calves', NULL, 'Machine'),

-- Shoulders
('Barbell Overhead Press', 'Deltoids', 'Triceps, Upper Chest', 'Barbell'),
('Dumbbell Overhead Press', 'Deltoids', 'Triceps, Upper Chest', 'Dumbbells'),
('Machine Overhead Press', 'Deltoids', 'Triceps, Upper Chest', 'Machine'),
('Dumbbell Lateral Raise', 'Lateral Deltoids', 'Traps', 'Dumbbells'),
('Cable Lateral Raise', 'Lateral Deltoids', 'Traps', 'Cable'),
('Face Pull', 'Rear Deltoids', 'Traps, Rotator Cuff', 'Cable'),
('Cable Rear Delt Fly', 'Rear Deltoids', 'Traps', 'Cable'),
('Machine Rear Delt Fly', 'Rear Deltoids', 'Traps', 'Machine'),

-- Arms: Biceps / Triceps
('Barbell Bicep Curl', 'Biceps', 'Forearms', 'Barbell'),
('Dumbbell Bicep Curl', 'Biceps', 'Forearms', 'Dumbbells'),
('Cable Bicep Curl', 'Biceps', 'Forearms', 'Cable'),
('Incline Dumbbell Curl', 'Biceps', 'Forearms', 'Dumbbells'),
('Barbell Preacher Curl', 'Biceps', 'Forearms', 'Barbell'),
('Dumbbell Preacher Curl', 'Biceps', 'Forearms', 'Dumbbells'),
('Machine Preacher Curl', 'Biceps', 'Forearms', 'Machine'),
('Dumbbell Hammer Curl', 'Forearms', 'Biceps', 'Dumbbells'),
('Rope Hammer Curl', 'Forearms', 'Biceps', 'Cable'),
('Incline Hammer Curl', 'Forearms', 'Biceps', 'Dumbbells'),
('Triceps Pushdown', 'Triceps', NULL, 'Cable'),
('Overhead Triceps Extension', 'Triceps', NULL, 'Cable'),
('Skull Crushers', 'Triceps', 'Forearms', 'EZ-Bar'),

--Abs
('Decline Crunches', 'Abs', NULL, 'Bodyweight'),
('Weighted Decline Crunches', 'Abs', NULL, 'Plate'),
('Cable Crunches', 'Abs', NULL,'Cable'),
('Leg Raises', 'Abs', NULL, 'Bodyweight'),
('Machine Crunches', 'Abs', NULL, 'Machine');