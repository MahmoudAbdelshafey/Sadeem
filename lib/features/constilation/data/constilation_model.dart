class ConstilationModel {
   String? conName;
   List<StarModel>? allStars;

  ConstilationModel({ this.conName,  this.allStars});
 factory ConstilationModel.fromjson(parsedData){
List<StarModel> data= [];
   for(int i = 0; i<parsedData['constellation_stars'].length; i++){
     data.add(StarModel.fromJson(parsedData['constellation_stars'][i]));
   }
   return ConstilationModel(conName: parsedData['constellation_name'], allStars: data);

 }
}

class StarModel {
   double? x;
   double? y;
   double? z;
   double? brightnessPersent;
   String? starName;
   int? solutionId;
   String? DESIGNATION;
   int? SOURCEID;

   StarModel(
      { this.x,  this.y,  this.z,  this.brightnessPersent,  this.starName,  this.solutionId,  this.DESIGNATION,  this.SOURCEID});

  factory StarModel.fromJson(parsedData){
    return StarModel(x: parsedData['x'],
        y: parsedData['y'],
        z: parsedData['z'],
        brightnessPersent: parsedData['brightness_persent'],
        starName: parsedData['star_name'],
        solutionId: parsedData['solution_id'],
        DESIGNATION: parsedData['DESIGNATION'],
        SOURCEID: parsedData['SOURCE_ID']);
  }
}