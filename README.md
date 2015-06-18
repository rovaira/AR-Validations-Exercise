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
Comment.where("body LIKE '%brussels%'")
=> [#<Comment:0x007fbba2c06448 id: 6, recipe_id: 7, body: "scallosp & brussels sprouts? really?">]
