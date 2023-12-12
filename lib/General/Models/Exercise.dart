class Exercise{
 String id;
 String name;
 String description;
 String type_exercise;
 String body_part;
 String equipment;
 String level;
 String rating;
 String rating_desc;

 Exercise(this.id, this.name, this.description, this.type_exercise, this.body_part, this.equipment, this.level, this.rating, this.rating_desc);
}

class ExerciseCard{
 String id;
 String name;
 String description;
 String type_exercise;
 String createdAt;
 String body_part;
 String equipment;
 String level;

 ExerciseCard(this.id, this.name,this.description, this.type_exercise, this.createdAt, this.body_part, this.equipment, this.level);
}