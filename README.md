# Brussels Sprouts Recipe Blog with ActiveRecord

#1 - How would you return all the recipes in your database?
Recipe.all
=> [#<Recipe:0x007fbba2dd67c8 id: 1, name: "BS & Steak", created_at: 2015-06-17 04:09:27 UTC, updated_at: 2015-06-17 04:09:27 UTC>,
 #<Recipe:0x007fbba2dd6480 id: 2, name: "BS & Fish", created_at: 2015-06-17 04:09:49 UTC, updated_at: 2015-06-17 04:09:49 UTC>,
 #<Recipe:0x007fbba2dd6228 id: 3, name: "BS & Chicken", created_at: 2015-06-17 04:10:19 UTC, updated_at: 2015-06-17 04:10:19 UTC>,
 #<Recipe:0x007fbba2dd5f58 id: 6, name: "BS & Bacon", created_at: 2015-06-17 04:11:55 UTC, updated_at: 2015-06-17 04:11:55 UTC>,
 #<Recipe:0x007fbba2dd5cd8 id: 7, name: "BS & Scallops", created_at: 2015-06-17 04:18:03 UTC, updated_at: 2015-06-17 04:18:03 UTC>]

#2 - How would you return all the comments in your database?
Comment.all
=> [#<Comment:0x007fbba4607568 id: 1, recipe_id: 1, body: "i love steak">,
 #<Comment:0x007fbba46072e8 id: 2, recipe_id: 2, body: "fish is delISHious">,
 #<Comment:0x007fbba4607068 id: 3, recipe_id: 2, body: "fish, fish.. yum, yum">,
 #<Comment:0x007fbba4606e10 id: 4, recipe_id: 3, body: "chicken, the original white meat">,
 #<Comment:0x007fbba4606b90 id: 5, recipe_id: 3, body: "what is this blog even about? bs!">,
 #<Comment:0x007fbba4606938 id: 6, recipe_id: 7, body: "scallosp & brussels sprouts? really?">,
 #<Comment:0x007fbba46066b8 id: 7, recipe_id: 6, body: "bacon bacon bacon!!!">]

#3 - How would you return the most recent recipe posted in your database?
Recipe.last
=> #<Recipe:0x007fbba2eac9b8 id: 7, name: "BS & Scallops", created_at: 2015-06-17 04:18:03 UTC, updated_at: 2015-06-17 04:18:03 UTC>

#4 - How would you return all the comments of the most recent recipe in your database?
Recipe.last.comments
=> [#<Comment:0x007fbba30b9ff8 id: 6, recipe_id: 7, body: "scallosp & brussels sprouts? really?">]

#5 - How would you return the most recent comment of all your comments?
Comment.last
=> #<Comment:0x007fbba2eec658 id: 7, recipe_id: 6, body: "bacon bacon bacon!!!">

#6 - How would you return the recipe associated with the most recent comment in your database?
Comment.last.recipe
=> #<Recipe:0x007fbba2e6cf98 id: 6, name: "BS & Bacon", created_at: 2015-06-17 04:11:55 UTC, updated_at: 2015-06-17 04:11:55 UTC>

#7 - How would you return all comments that include the string brussels in them?
Comment.where("body ILIKE '%brussels%'")
=> [#<Comment:0x007fbba2c06448 id: 6, recipe_id: 7, body: "scallosp & brussels sprouts? really?">]

#-- Recipe Validations --#

# Validate that the title of each recipe exists.
[27] pry(main)> new_recipe = Recipe.create(name:"" )
=> #<Recipe:0x007fce527adaa0 id: nil, name: "", created_at: nil, updated_at: nil, yield: nil>

[28] pry(main)> new_recipe.errors
=> #<ActiveModel::Errors:0x007fce527ac7e0
 @base=#<Recipe:0x007fce527adaa0 id: nil, name: "", created_at: nil, updated_at: nil, yield: nil>,
 @messages={:name=>["must include Brussels sprouts in recipe name", "can't be blank"]}>

# Validate that the title of each recipe is unique.
[29] pry(main)> new_recipe = Recipe.create(name: "BS & Steak")
=> #<Recipe:0x007fce51d74f98 id: nil, name: "BS & Steak", created_at: nil, updated_at: nil, yield: nil>

[30] pry(main)> new_recipe.errors
=> #<ActiveModel::Errors:0x007fce51d6e3f0
 @base=#<Recipe:0x007fce51d74f98 id: nil, name: "BS & Steak", created_at: nil, updated_at: nil, yield: nil>,
 @messages={:name=>["must include Brussels sprouts in recipe name", "has already been taken"]}>

# Validate that the title of each recipe contains "Brussels sprouts" in it.
[31] pry(main)> new_recipe = Recipe.create(name: "Fish Tacos")
=> #<Recipe:0x007fce51cd7ba8 id: nil, name: "Fish Tacos", created_at: nil, updated_at: nil, yield: nil>

[32] pry(main)> new_recipe.errors
=> #<ActiveModel::Errors:0x007fce51cd6bb8
 @base=#<Recipe:0x007fce51cd7ba8 id: nil, name: "Fish Tacos", created_at: nil, updated_at: nil, yield: nil>,
 @messages={:name=>["must include Brussels sprouts in recipe name"]}>

# Add a field yield to your Recipe table. Yield is explained here. yield is optional, but if supplied, it must be greater than or equal to 1. Write a validation for this.

[33] pry(main)> new_recipe = Recipe.create(name: "Brussels sprouts soup", yield: 0)
=> #<Recipe:0x007fce51c43408 id: nil, name: "Brussels sprouts soup", created_at: nil, updated_at: nil, yield: 0>

[34] pry(main)> new_recipe.errors
=> #<ActiveModel::Errors:0x007fce51c419c8
 @base=#<Recipe:0x007fce51c43408 id: nil, name: "Brussels sprouts soup", created_at: nil, updated_at: nil, yield: 0>,
 @messages={:yield=>["must be greater than or equal to 1"]}>

#-- Comment Validations --#

# Validate that the length of a comment be a maximum of 140 characters long.
[45] pry(main)> new_recipe = Recipe.create(name: "Brussels sprouts burritos", yield: 1)
=> #<Recipe:0x007fce51c91720 id: 9, name: "Brussels sprouts burritos", created_at: 2015-06-18 04:20:48 UTC, updated_at: 2015-06-18 04:20:48 UTC, yield: 1>

[46] pry(main)> new_comment = Comment.create(body: "WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!", recipe_id: new_recipe.id)
=> #<Comment:0x007fce51cfca20
 id: nil,
 recipe_id: 9,
 body: "WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!">

[47] pry(main)> new_comment.errors
=> #<ActiveModel::Errors:0x007fce51d07830
 @base=
  #<Comment:0x007fce51cfca20
   id: nil,
   recipe_id: 9,
   body: "WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!WIN AN IPHONE!!">,
 @messages={:body=>["is too long (maximum is 140 characters)"]}>

# Validate that a comment has a recipe.
[39] pry(main)> new_comment = Comment.create(body: "I really love Brussels sprouts soup!")
=> #<Comment:0x007fce51bcf7d8 id: nil, recipe_id: nil, body: "I really love Brussels sprouts soup!">

[40] pry(main)> new_comment.errors
=> #<ActiveModel::Errors:0x007fce51bccf38
 @base=#<Comment:0x007fce51bcf7d8 id: nil, recipe_id: nil, body: "I really love Brussels sprouts soup!">,
 @messages={:recipe_id=>["can't be blank"]}>
