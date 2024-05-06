extends Resource
class_name ingredient

@export var Name:String 
@export var Icon:Texture2D


@export_enum("Meat", "Vegen", "Vegetarian") var Diet: String
@export_enum("Not Spicy", "Spicy") var IsSpice:int
@export_enum("Cold","Hot") var IsHot: int

