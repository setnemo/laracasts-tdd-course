## My notes for the course 'Lets Build a Forum With Laravel And TDD'

[Link to the course][0]

### Lesson 1 : [link][2]
Commands:
```bash
php artisan make:model Thread -mr
php artisan migrate
php artisan make:model Reply -mc
php artisan tinker
>>> factory('App\Thread', 50)->create();
php artisan migrate:refresh 
>>> $threads = factory('App\Thread', 50)->create();
>>> $threads->each(function ($thread) { factory('App\Reply', 10)->create(['thread_id' => $thread->id]); });
```





[0]: https://laracasts.com/series/lets-build-a-forum-with-laravel
[1]: https://laracasts.com/series/lets-build-a-forum-with-laravel/episodes/1
