# smart_cooking

Flutter application for searching recipes.

# Now

App uses 2 API's. 

[First API](https://spoonacular.com/food-api) is used for getting recipes.

[Second API](https://pleasurecookings.azurewebsites.net/swagger/ui/index#/) was created for the needs of the academic's project by [my colleague](https://github.com/mbazych). This API allows us to add accounts where we are able to keep our favourite recipes and history of recipes.



# In future

App is using only one account being automatically signing in without typing username or password. It is happenning because it is only test for now. In the near future I'm going to add register and login forms.  
I'll try add posibility for creating own recipes by users. It's going to be kept in our data base. Then try to shuffle recipes from first and second API's.

# How to use

To start using app You need to:
  - get api Key from [spoonacular](https://spoonacular.com/food-api)
  - create file: ```lib/sensitive.dart```
  - In created file type:
    ```
    class Sensitive{
      static const String API_KEY = "YOUR_OWN_API_KEY_FROM_SPOONACULAR";
    }
    ```
    in place YOUR_OWN_API_KEY_FROM_SPOONACULAR paste Your Api Key.

# Screenshots of app

<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/intro.png" height=500 /><br /><img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/dashboard_white.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/dashboard_black.png" height=490 /><br />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/drawer_white.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/drawer_black.png" height=500 />
<br /><img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/details_1_white.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/details_1_black.png" height=500 /><br />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/details_2_white.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/details_2_black.png" height=500 /><br />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/recipes_white.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/recipes_black.png" height=500 /><br />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/searching_white.png" height=500 />
<img src="https://github.com/Czarczynski/Projects/blob/master/flutter/smart_cooking/Gitscreens/searching_black.png" height=500 />
