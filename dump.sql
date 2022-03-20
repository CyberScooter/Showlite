
    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Toy Story', 'Led by Woody, Andy''s toys live happily in his room until Andy''s birthday brings Buzz Lightyear onto the scene. Afraid of losing his place in Andy''s heart, Woody plots against Buzz. But when circumstances separate Buzz and Woody from their owner, the duo eventually learns to put aside their differences.', '/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Animation', now(), now()),('Comedy', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Animation','Comedy','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Jumanji', 'When siblings Judy and Peter discover an enchanted board game that opens the door to a magical world, they unwittingly invite Alan -- an adult who''s been trapped inside the game for 26 years -- into their living room. Alan''s only hope for freedom is to finish the game, which proves risky as all three find themselves running from giant rhinoceroses, evil monkeys and other terrifying creatures.', '/6aGn2X51bahFoOI8wE1h2VGTgcH.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Adventure', now(), now()),('Fantasy', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Adventure','Fantasy','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Grumpier Old Men', 'A family wedding reignites the ancient feud between next-door neighbors and fishing buddies John and Max. Meanwhile, a sultry Italian divorcée opens a restaurant at the local bait shop, alarming the locals who worry she''ll scare the fish away. But she''s less interested in seafood than she is in cooking up a hot time with Max.', '/1FSXpj5e8l4KH6nVFO5SPUeraOt.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Romance', now(), now()),('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Romance','Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Waiting to Exhale', 'Cheated on, mistreated and stepped on, the women are holding their breath, waiting for the elusive "good man" to break a string of less-than-stellar lovers. Friends and confidants Vannah, Bernie, Glo and Robin talk it all out, determined to find a better way to breathe.', '/4wjGMwPsdlvi025ZqR4rXnFDvBz.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Father of the Bride Part II', 'Just when George Banks has recovered from his daughter''s wedding, he receives the news that she''s pregnant ... and that George''s wife, Nina, is expecting too. He was planning on selling their home, but that''s a plan that -- like George -- will have to change with the arrival of both a grandchild and a kid of his own.', '/rj4LBtwQ0uGrpBnCELr716Qo3mw.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Heat', 'Obsessive master thief, Neil McCauley leads a top-notch crew on various insane heists throughout Los Angeles while a mentally unstable detective, Vincent Hanna pursues him without rest. Each man recognizes and respects the ability and the dedication of the other even though they are aware their cat-and-mouse game may end in violence.', '/obpPQskaVpSiC9RcJRB6iWDTCXS.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Crime', now(), now()),('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Crime','Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Sabrina', 'An ugly duckling having undergone a remarkable change, still harbors feelings for her crush: a carefree playboy, but not before his business-focused brother has something to say about it.', '/z1oNjotUI7D06J4LWQFQzdIuPnf.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Tom and Huck', 'A mischievous young boy, Tom Sawyer, witnesses a murder by the deadly Injun Joe. Tom becomes friends with Huckleberry Finn, a boy with no future and no family. Tom has to choose between honoring a friendship or honoring an oath because the town alcoholic is accused of the murder. Tom and Huck go through several adventures trying to retrieve evidence.', '/vIG8hWOa7DyLMRiurzKwVAnIYoU.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()),('Drama', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure','Drama','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Sudden Death', 'International action superstar Jean Claude Van Damme teams with Powers Boothe in a Tension-packed, suspense thriller, set against the back-drop of a Stanley Cup game.Van Damme portrays a father whose daughter is suddenly taken during a championship hockey game. With the captors demanding a billion dollars by game''s end, Van Damme frantically sets a plan in motion to rescue his daughter and abort an impending explosion before the final buzzer...', '/1pylO6YX5XdOA6QCc5IRxrrffkg.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'GoldenEye', 'James Bond must unmask the mysterious head of the Janus Syndicate and prevent the leader from utilizing the GoldenEye weapons system to inflict devastating revenge on Britain.', '/bFzjdy6ucvNlXmJwoSoYfufV6lP.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Adventure', now(), now()),('Action', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Adventure','Action','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The American President', 'Widowed U.S. president Andrew Shepherd, one of the world''s most powerful men, can have anything he wants -- and what he covets most is Sydney Ellen Wade, a Washington lobbyist. But Shepherd''s attempts at courting her spark wild rumors and decimate his approval ratings.', '/yObOAYFIHXHkFPQ3jhgkN2ezaD.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Dracula: Dead and Loving It', 'When a lawyer shows up at the vampire''s doorstep, he falls prey to his charms and joins him in his search for fresh blood. Enter Dr. van Helsing, who may be the only one able to vanquish the count.', '/4rRfZz8YnHNRr16t3CFcJrPdXHi.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Horror', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Horror')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Balto', 'An outcast half-wolf risks his life to prevent a deadly epidemic from ravaging Nome, Alaska.', '/dCVcdb5oxDizqFLz0F7TE60NoC9.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Family', now(), now()),('Animation', now(), now()),('Adventure', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Family','Animation','Adventure')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Nixon', 'An all-star cast powers this epic look at American President Richard M. Nixon, a man carrying the fate of the world on his shoulders while battling the self-destructive demands within. Spanning his troubled boyhood in California to the shocking Watergate scandal that would end his presidency.', '/ORlTkdDwWU94O16MlwfIR4g5Hk.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('History', now(), now()),('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('History','Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Cutthroat Island', 'Morgan Adams and her slave, William Shaw, are on a quest to recover the three portions of a treasure map. Unfortunately, the final portion is held by her murderous uncle, Dawg. Her crew is skeptical of her leadership abilities, so she must complete her quest before they mutiny against her. This is made yet more difficult by the efforts of the British crown to end her pirate raids.', '/hYdeBZ4BFXivdouxLfQGWNE6zRx.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Casino', 'The life of the gambling paradise – Las Vegas – and its dark mafia underbelly.', '/znekQtDwXQrll2XYZqXOxncCgLd.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Sense and Sensibility', 'Rich Mr. Dashwood dies, leaving his second wife and her daughters poor by the rules of inheritance. Two daughters are the titular opposites.', '/cBK2yL3HqhFvIVd7lLtazWlRZPR.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Four Rooms', 'It''s Ted the Bellhop''s first night on the job...and the hotel''s very unusual guests are about to place him in some outrageous predicaments. It seems that this evening''s room service is serving up one unbelievable happening after another.', '/75aHn1NOYXh4M7L5shoeQ6NGykP.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Crime', now(), now()),('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Crime','Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Ace Ventura: When Nature Calls', 'Summoned from an ashram in Tibet, Ace finds himself on a perilous journey into the jungles of Africa to find Shikaka, the missing sacred animal of the friendly Wachati tribe. He must accomplish this before the wedding of the Wachati''s Princess to the prince of the warrior Wachootoos. If Ace fails, the result will be a vicious tribal war.', '/wcinCf1ov2D6M3P7BBZkzQFOiIb.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Crime', now(), now()),('Comedy', now(), now()),('Adventure', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Crime','Comedy','Adventure')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Money Train', 'A vengeful New York transit cop decides to steal a trainload of subway fares; his foster brother, a fellow cop, tries to protect him.', '/jWBDz6Mf9aQVBiUS76JQsEhvoJl.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Comedy', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Comedy','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Get Shorty', 'Chili Palmer is a Miami mobster who gets sent by his boss, the psychopathic "Bones" Barboni, to collect a bad debt from Harry Zimm, a Hollywood producer who specializes in cheesy horror films. When Chili meets Harry''s leading lady, the romantic sparks fly. After pitching his own life story as a movie idea, Chili learns that being a mobster and being a Hollywood producer really aren''t all that different.', '/r82SdPhg4fnIcLt0ogIjQxqjdcO.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Thriller', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Thriller','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Copycat', 'An agoraphobic psychologist and a female detective must work together to take down a serial killer who copies serial killers from the past.', '/sch1NNy1q6O50qaUG0MqoU8z9GD.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Assassins', 'Assassin Robert Rath arrives at a funeral to kill a prominent mobster, only to witness a rival hired gun complete the job for him -- with grisly results. Horrified by the murder of innocent bystanders, Rath decides to take one last job and then return to civilian life. But finding his way out of the world of contract killing grows ever more dangerous as Rath falls for his female target and becomes a marked man himself.', '/wPmZYnaQpxwoHmwNwVhZ2IY0UbF.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()),('Crime', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure','Crime','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Powder', 'Harassed by classmates who won''t accept his shocking appearance, a shy young man known as "Powder" struggles to fit in. But the cruel taunts stop when Powder displays a mysterious power that allows him to do incredible things. This phenomenon changes the lives of all those around him in ways they never could have imagined.', '/kImKATjY4EsK5MDgrmpJdGbQEbq.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Fantasy', now(), now()),('Science Fiction', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Fantasy','Science Fiction','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Leaving Las Vegas', 'Ben Sanderson, an alcoholic Hollywood screenwriter who lost everything because of his drinking, arrives in Las Vegas to drink himself to death. There, he meets and forms an uneasy friendship and non-interference pact with prostitute Sera.', '/nqc2LaUWB4ePf6IqpJ6D8apBDvn.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Othello', 'The evil Iago pretends to be friend of Othello in order to manipulate him to serve his own end in the film version of this Shakespeare classic.', '/nNP3FDHUIyztw5eq5AejZKzqXbz.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Now and Then', 'Waxing nostalgic about the bittersweet passage from childhood to puberty in this tender coming-of-age tale, four childhood girlfriends -- Teeny, Chrissy, Samantha and Roberta -- recall the magical summer of 1970. During their walk down memory lane, they reconcile experiences with boys, secrets, bullies and more.', '/5nkAaadxFzzYfFyN3Q5j4VZKRsA.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Persuasion', 'This film adaptation of Jane Austen''s last novel follows Anne Elliot, the daughter of a financially troubled aristocratic family, who is persuaded to break her engagement to Frederick Wentworth, a young sea captain of meager means. Years later, money troubles force Anne''s father to rent out the family estate to Admiral Croft, and Anne is again thrown into company with Frederick -- who is now rich, successful and perhaps still in love with Anne.', '/tYOFCtgLb4hfuwhXKBWwAobWhwS.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'La Cité des Enfants Perdus', 'A scientist in a surrealist society kidnaps children to steal their dreams, hoping that they slow his aging process.', '/whwT3Q9JxbAYzEc3t7uYYcCbTMf.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Fantasy', now(), now()),('Science Fiction', now(), now()),('Adventure', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Fantasy','Science Fiction','Adventure')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, '摇啊摇，摇到外婆桥', 'A provincial boy related to a Shanghai crime family is recruited by his uncle into cosmopolitan Shanghai in the 1930s to be a servant to a ganglord''s mistress.', '/tzG1UxUSfPACREjgBrsPDRUvneH.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Dangerous Minds', 'Former Marine Louanne Johnson lands a gig teaching in a pilot program for bright but underachieving teens at a notorious inner-city high school. After having a terrible first day, she decides she must throw decorum to the wind. When Johnson returns to the classroom, she does so armed with a no-nonsense attitude informed by her military training and a fearless determination to better the lives of her students -- no matter what the cost.', '/yWHWC8fJRp2kLgiFrEa8o3krOH9.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Twelve Monkeys', 'In the year 2035, convict James Cole reluctantly volunteers to be sent back in time to discover the origin of a deadly virus that wiped out nearly all of the earth''s population and forced the survivors into underground communities. But when Cole is mistakenly sent to 1990 instead of 1996, he''s arrested and locked up in a mental hospital. There he meets psychiatrist Dr. Kathryn Railly, and patient Jeffrey Goines, the son of a famous virus expert, who may hold the key to the mysterious rogue group, the Army of the 12 Monkeys, thought to be responsible for unleashing the killer disease.', '/fCZnJSARoTbLefr9ThwWBSkJ7oR.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Science Fiction', now(), now()),('Thriller', now(), now()),('Mystery', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Science Fiction','Thriller','Mystery')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Guillaumet, les ailes du courage', '', '/zoxqNb6v55C35DDqNn03Grzhzgr.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Romance', now(), now()),('Adventure', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Romance','Adventure')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Babe', 'Babe is a little pig who doesn''t quite know his place in the world. With a bunch of odd friends, like Ferdinand the duck who thinks he is a rooster and Fly the dog he calls mom, Babe realizes that he has the makings to become the greatest sheep pig of all time, and Farmer Hogget knows it. With the help of the sheep dogs Babe learns that a pig can be anything that he wants to be.', '/zKuQMtnbVTz9DsOnOJmlW71v4qH.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Fantasy', now(), now()),('Drama', now(), now()),('Comedy', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Fantasy','Drama','Comedy','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Carrington', 'The story of the relationship between painter Dora Carrington and author Lytton Strachey in a World War One England of cottages and countryside. Although platonic due to Strachey''s homosexuality, the relationship was nevertheless a deep and complicated one. When Carrington did develop a more physical relationship with soldier Ralph Partridge, Strachey was able to welcome him as a friend, although Partridge remained somewhat uneasy, not so much with Strachey''s lifestyle and sexual orientation as with the fact that he was a conscientious objector.', '/8NmeBTkC4UQa8XT2GGsBN2R8Bqo.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('History', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('History','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Dead Man Walking', 'A justice drama based on a true story about a man on death row who in his last days forms a strong relationship with a nun who teaches him forgiveness and gives him spirituality as she accompanies him to his execution. Susan Sarandon won an Oscar for best female actress for her convincing portrayal of Sister Helen Prejean.', '/wQmmJi5ypfHH2boXrQBmsep7qb2.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Across the Sea of Time', 'A young Russian boy, Thomas Minton, travels to New York as a passenger on a Russian freighter. Close to Ellis Island he gets off and thus starts his journey to America the same way as all immigrants in former times. Thomas is searching for the family of one of his ancestors, who had emigrated decades ago, but once sent a letter home together with a sample of his new profession: 3D-Photography. The boy follows his relative''s traces by counter-checking the old 3D-Photographs of New York (using an antique viewer) with the same places and how they look today. This way, the audience gets to see the Big Apple in former times as well as today.', 'None', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Adventure', now(), now()),('History', now(), now()),('Drama', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Adventure','History','Drama','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'It Takes Two', 'Identical 9-year-olds from very different backgrounds: orphaned Amanda and wealthy Alyssa meet at summer camp and decide to switch places -- and play matchmaker between Alyssa''s dad, Roger, and the kind social worker who cares for Amanda.', '/sdes5TrRbymELYLG85YIxmFb1OP.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Family', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Family','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Clueless', 'Shallow, rich and socially successful Cher is at the top of her Beverly Hills high school''s pecking scale. Seeing herself as a matchmaker, Cher first coaxes two teachers into dating each other. Emboldened by her success, she decides to give hopelessly klutzy new student Tai a makeover. When Tai becomes more popular than she is, Cher realizes that her disapproving ex-stepbrother was right about how misguided she was -- and falls for him.', '/8AwVTcgpTnmeOs4TdTWqcFDXEsA.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Cry, the Beloved Country', 'A South-African preacher goes to search for his wayward son who has committed a crime in the big city.', '/kGPsBswFOCjiGzXq4OZwzEAAODa.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Richard III', 'Shakespeare''s Play transplanted into a 1930s setting.', '/aN2BcIH6rvGbYiRQCS8lxOdeeVQ.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('War', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','War')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Dead Presidents', 'Depicts a heist of old bills, retired from circulation and destined by the government to be "money to burn". However, more broadly, it addresses the issues of Black Americans'' involvement in the Vietnam War and their subsequent disillusionment with progress in social issues and civil rights back home in the United States, during the 1960s.', '/eGfsSXizR11tTHVo0kuOOFPAxZt.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Crime', now(), now()),('Drama', now(), now()),('History', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Crime','Drama','History')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Restoration', 'An aspiring young physician, Robert Merivel found himself in the service of King Charles II and saves the life of someone close to the King. Merivel joins the King''s court and lives the high life provided to someone of his position. Merivel is ordered to marry his King''s mistress in order to divert the queens suspicions. He is given one order by the king and that is not to fall in love. The situation worsens when Merivel finds himself in love with his new wife. Eventually, the King finds out and relieves Merivel of his position and wealth. His fall from grace leaves Merivel where he first started. And through his travels and reunions with an old friend, he rediscovers his love for true medicine and what it really means to be a physician.', '/z1YM3WFZnF2NwHT5IRGYUcvZBSl.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Mortal Kombat', 'For nine generations an evil sorcerer has been victorious in hand-to-hand battle against his mortal enemies. If he wins a tenth Mortal Kombat tournament, desolation and evil will reign over the multiverse forever. To save Earth, three warriors must overcome seemingly insurmountable odds, their own inner demons, and superhuman foes in this action/adventure movie based on one of the most popular video games of all time.', '/fcK7tzSSXMYiMN8E9KlZJL1BYyp.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Fantasy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Fantasy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'To Die For', 'Susan wants to work in television and will therefore do anything it takes, even if it means killing her husband. A very dark comedy from independent director Gus Van Sant with a brilliant Nicole Kidman in the leading role.', '/aedhsShrlJVhLlwhtlmFJgR4Szs.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Fantasy', now(), now()),('Drama', now(), now()),('Comedy', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Fantasy','Drama','Comedy','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'How To Make An American Quilt', 'Soon-to-be-wed graduate student Finn Dodd develops cold feet when she suspects her fiancé is cheating on her. In order to clear her head, Finn visits her grandmother, Hy, and great aunt, Glady Joe Cleary, in Grasse, Calif. There, Finn learns that Hy and Glady Joe are members of a group of passionate quilters, and over the course of her visit she is regaled with tales of love and life by women who have collected rich experiences and much wisdom.', '/vwYRaERccwXWCYrTzeWRZRarJOo.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Se7en', 'Two homicide detectives are on a desperate hunt for a serial killer whose crimes are based on the "seven deadly sins" in this dark and haunting film that takes viewers from the tortured remains of one victim to the next. The seasoned Det. Sommerset researches each sin in an effort to get inside the killer''s mind, while his novice partner, Mills, scoffs at his efforts to unravel the case.', '/69Sns8WoET6CfaYlIkHbla4l7nC.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Crime', now(), now()),('Mystery', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Crime','Mystery','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Pocahontas', 'History comes gloriously to life in Disney''s epic animated tale about love and adventure in the New World. Pocahontas is a Native American woman whose father has arranged for her to marry her village''s best warrior. But a vision tells her change is coming, and soon she comes face to face with it in the form of Capt. John Smith.', '/kZ1ft0QZ4e3zDUPMBftEkwI9ftd.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Adventure', now(), now()),('Animation', now(), now()),('Drama', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Adventure','Animation','Drama','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'When Night Is Falling', 'A prudish woman, working on tenure as a literacy professor at a large urban university, finds herself strangely attracted to a free-spirited, liberal woman whom works at a local carnival which comes to town.', '/f9edMkT6bLXVvZICn47ARnQ1Iu5.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The Usual Suspects', 'Held in an L.A. interrogation room, Verbal Kint attempts to convince the feds that a mythic crime lord, Keyser Soze, not only exists, but was also responsible for drawing him and his four partners into a multi-million dollar heist that ended with an explosion in San Pedro harbor – leaving few survivors. Verbal lures his interrogators with an incredible story of the crime lord''s almost supernatural prowess.', '/bUPmtQzrRhzqYySeiMpv7GurAfm.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Crime', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Crime','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Guardian Angel', 'Detective - turned - bodyguard Cynthia McKay (Cynthia Rothrock) is hired by a psychotic icy seductress, Nina Lindell (Lydie Denier), the same woman who killed Mckay''s lover months earlier.  With vendetta in her heart McKay accompanies the flamboyantly playful womanizer through the glamourous world of the super-rich as his protector.  In a unique role reversal, it is the woman protecting the man from another woman, erupting into a deadly triangle of passion, suspense and action.', '/AoRBM85EbRY9U0jtgy88DtV99Jl.jpg', '1994', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Thriller', now(), now()),('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Thriller','Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Mighty Aphrodite', 'When Lenny and his wife, Amanda, adopt a baby, Lenny realizes that his son is a genius and becomes obsessed with finding the boy''s biological mother in hopes that she will be brilliant too. But when he learns that Max''s mother is Linda Ash, a kindhearted prostitute and porn star, Lenny is determined to reform her immoral lifestyle. A Greek chorus chimes in to relate the plot to Greek mythology in this quirky comedy.', '/m0MZabFBNtMuFn3oNcq45M1Jws3.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Lamerica', 'Fiore, an Italian conman, arrives in post Communist Albania with Gino, his young apprentice, to set up a shoe factory that will never open. The con requires a native Albanian, so they designate Spiro, an impoverished and confused former political prisoner as chairman of the board. When Fiore returns to Italy to get government funds for the project, Spiro unexpectedly disappears and Gino sets out on a journey to find him. The search leads him to discover Spiro''s tragic personal history and witness Albanian poverty firsthand.', '/nnLpA4mqb3gvhNJQZ00cOyBmeq3.jpg', '1994', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Foreign', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Foreign')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The Big Green', 'In a depressed Texas town, British foreign exchange teacher Anna attempts to inject some life into her hopeless kids by introducing them to soccer. They''re terrible at first, but Anna and her football-hero assistant whip them into shape. As they work overtime, the pair help kids build their self-esteem and also get involved in solving family squabbles.', '/nVHqIuBTcTLmAIrML7T704UwfNI.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()),('Comedy', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure','Comedy','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Georgia', 'Sadie looks up to her older sister Georgia, a successful folk singer who''s happily married with children, but can''t break out of the bar-band circuit and hit the big time she desperately covets. It''s in part due to her attraction to drugs and booze, and also to her own unwise choice in men. Finally, though, Sadie''s Achilles heel is a rough, unlovely voice very different than her sister''s crowd-pleasing singing.', '/uXjfK404xo7SiVlFcAoRyaFqXR4.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    
insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Kids of the Round Table', 'Set in modern times, Alex finds King Arthur''s sword Excalibur and must prove himself worthy of it.', '/1y8KAZOKrdmTI2sddcilcbRsMtI.jpg' , '1997', now(), now()) returning id;

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Home for the Holidays', 'After losing her job, making out with her soon to be ex-boss, and finding out that her daughter plans to spend Thanksgiving with her boyfriend, Claudia Larson has to face spending the holiday with her family. She wonders if she can survive their crazy antics.', '/a8MslR6deQQVe8JR542XDSwHiPB.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Il postino', 'Simple Italian postman learns to love poetry while delivering mail to a famous poet; he uses this to woo local beauty Beatrice.', '/cUaCpjVDefYShKyLmkcDsiPaBHn.jpg', '1994', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Le confessionnal', 'The year is 1952, in Quebec City. Rachel (16), unmarried and pregnant, works in the church. Filled with shame, she unburdens her guilt to a young priest, under the confidentiality of the confessional. In the present year of 1989, Pierre Lamontagne has returned to Quebec to attend his father''s funeral. He meets up with his adopted brother, Marc, who has begun questioning his identity and has embarked on a quest for his roots that would lead them to the Quebec of the 1950s. Past and present converge in a complex web of intrigue where the answer to the mystery lies.', '/9ApR0PwQdlnvc76NmlbUWkeAK9i.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Thriller', now(), now()),('Drama', now(), now()),('Mystery', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Thriller','Drama','Mystery')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The Indian in the Cupboard', 'A nine-year-old boy gets a plastic Indian and a cupboard for his birthday and finds himself involved in adventure when the Indian comes to life and befriends him.', '/ozQAmW85tTJu2dhRe3evzyY03Nb.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Adventure', now(), now()),('Family', now(), now()),('Fantasy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Adventure','Family','Fantasy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Eye for an Eye', 'It''s fire and brimstone time as grieving mother Karen McCann takes justice into her own hands when a kangaroo court in Los Angeles fails to convict Robert Doob, the monster who raped and murdered her 17-year-old daughter.', '/y2lZSdJ1o0VvLegTw3ad6KFtxra.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Mr. Holland''s Opus', 'In 1965, passionate musician Glenn Holland takes a day job as a high school music teacher, convinced it''s just a small obstacle on the road to his true calling: writing a historic opus. As the decades roll by with the composition unwritten but generations of students inspired through his teaching, Holland must redefine his life''s purpose.', '/kBmwWeSN3ajnYHZ3dSybEobxEPI.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Music', now(), now()),('Drama', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Music','Drama','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Don''t Be a Menace to South Central While Drinking Your Juice in the Hood', 'When Ashtray (Shawn Wayans) moves to South Central L.A. to live with his father (who appears to be the same age he is) and grandmother (who likes to talk tough and smoke reefer), he falls in with his gang-banging cousin Loc Dog (Marlon Wayans), who along with the requisite pistols and Uzi carries a thermo-nuclear warhead for self-defense. Will Ashtray be able to keep living the straight life?', '/HZQBF7JDd2e9p4rPSbSHuWHaCC.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Two If by Sea', 'Frank O''Brien, a petty thief, and his 7-year-long girlfriend Roz want to put an end to their unsteady lifestyle and just do that last job, which involves stealing a valuable painting. Frank takes Roz to an island on the coast of New England, where he wants to sell the painting and also hopes that their sagging relationship will get a positive push back up. Not everything goes as planned.', '/xSfqAMYqrTtDeAjPtYo0S8nc5Zz.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Bio-Dome', 'Bud and Doyle are two losers who are doing nothing with their lives. Both of their girlfriends are actively involved in saving the environment, but the two friends couldn''t care less about saving the Earth. One day, when a group of scientists begin a mission to live inside a "Bio-Dome" for a year without outside contact, Bud and Doyle mistakenly become part of the project themselves.', '/pjSkGZAvksrbO6tGain8PJ3rfC7.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Lawnmower Man 2: Beyond Cyberspace', 'Jobe is resuscitated by Jonathan Walker. He wants Jobe to create a special computer chip that would connect all the computers in the world into one network, which Walker would control and use. But what Walker doesn''t realize is a group of teenage hackers are on to him and out to stop his plan.', '/nsKDpcdC62krEPlCKKjLSHuMwwu.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Science Fiction', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Science Fiction')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Two Bits', 'It''s a hot summer day in 1933 in South Philly, where 12-year old Gennaro lives with his widowed mom and his ailing grandpa, who sits outside holding tight to his last quarter, which he''s promised to Gennaro and which Gennaro would like to have to buy a ticket to the plush new movie theater. But grandpa''s not ready to pass on the quarter or pass on to his final reward: he has some unfinished business with a woman from his past, and he enlists Gennaro to act as his emissary.', '/ianK4zwR5Vv4JSDm3sNDh3kH86I.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Gazon maudit', 'After learning of her husband''s infidelities, a housewife invites an itinerant lesbian to move in with them. None of their lives will ever be the same again.', '/6yJNScj2ypxqCOCfpSPR3xX4J4E.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Friday', 'Craig and Smokey are two guys in Los Angeles hanging out on their porch on a Friday afternoon, smoking and drinking, looking for something to do.', '/2lReF53F8trkC68piGSfk0JVwWU.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'From Dusk Till Dawn', 'Seth Gecko and his younger brother Richard are on the run after a bloody bank robbery in Texas. They escape across the border into Mexico and will be home-free the next morning, when they pay off the local kingpin. They just have to survive ''from dusk till dawn'' at the rendezvous point, which turns out to be a Hell of a strip joint.', '/sV3kIAmvJ9tPz4Lq5fuf9LLMxte.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Horror', now(), now()),('Action', now(), now()),('Thriller', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Horror','Action','Thriller','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Fair Game', 'Max Kirkpatrick is a cop who protects Kate McQuean, a civil law attorney, from a renegade KGB team out to terminate her', '/qcxsWOzBaF7MZNNThtRQWQ9Wrdk.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Thriller', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Thriller','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Kicking and Screaming', 'After college graduation, Grover''s girlfriend Jane tells him she''s moving to Prague to study writing. Grover declines to accompany her, deciding instead to move in with several friends, all of whom can''t quite work up the inertia to escape their university''s pull. Nobody wants to make any big decisions that would radically alter his life, yet none of them wants to end up like Chet, the professional student who tends bar and is in his tenth year of university studies.', '/186brkmaBmopqcM0dPs71tj9BfM.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Les misérables', 'In France during World War II, a poor and illiterate man, Henri Fortin (Jean-Paul Belmondo), is introduced to Victor Hugo''s classic novel Les Misérables and begins to see parallels between the book and his own life.', '/ct1T56BbeE60CsoFhUB4Qmq8kkf.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('History', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','History')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Bed of Roses', 'The seeds of love are planted when Lisa, a high-powered investment banker, receives flowers from a secret admirer. But when his fairy-tale fantasies clash with her workaholic ways, they soon find out that sometimes, it''s harder than it seems for love to conquer all.', '/nLRio5v1QHW0Dw4VLmMhC1FZEJc.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Big Bully', 'A writer returns to his hometown where he faces the childhood nemesis whose life he ultimately ruined, only the bully wants to relive their painful past by torturing him once again.', '/dws3JR4Yi325Tz33XnuXEB6XjGr.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Screamers', '(SIRIUS 6B, Year 2078) On a distant mining planet ravaged by a decade of war, scientists have created the perfect weapon: a blade-wielding, self-replicating race of killing devices known as Screamers designed for one purpose only -- to hunt down and destroy all enemy life forms.', '/oDGJGbzBkNXhCZfZMR6gjtKkKkI.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Horror', now(), now()),('Science Fiction', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Horror','Science Fiction')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Nico Icon', 'A look into the many lives of Christa Päffgen, otherwise known as Nico; from cutie German mädchen to the first of the supermodels, to glamorous diva of the Velvet Underground, to cult item, junkie and hag. Many faces for the same woman, whom, you realize, just couldn''t bring herself to care enough to live.', '/4qO219U8z1XeHLni800jCsbpSs0.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Documentary', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Documentary')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The Crossing Guard', 'After his daughter died in a hit and run, Freddy Gale has waited six years for John Booth, the man responsible, to be released from prison. On the day of release, Gale visits Booth and announces that he will kill him in one week. Booth uses his time to try and make peace with himself and his entourage, and even finds romance. Gale, whose life is spiraling down because of his obsession towards Booth, will bring himself on the very edge of sanity. At he end of the week, both men will find themselves on a collision course with each other.', '/kogaCIIylHmWQo2gJrrdq8Br8b8.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The Juror', 'With his gangster boss on trial for murder, a mob thug known as "the Teacher" tells Annie Laird she must talk her fellow jurors into a not-guilty verdict, implying that he''ll kill her son Oliver if she fails. She manages to do this, but, when it becomes clear that the mobsters might want to silence her for good, she sends Oliver abroad and tries to gather evidence of the plot against her, setting up a final showdown.', '/i1EXzLNc4c9Xd0xjCmGavb0Hz9k.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'بادکنک سفید', 'Several people try to take advantage of a little girl''s innocence to hustle money her mom gave to her to buy a goldfish with.', '/u6jrlgZZx3zSFPDPTVOYpueljgH.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Family', now(), now()),('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Family','Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Things to Do in Denver When You''re Dead', 'A mafia film in Tarantino style with a star-studded cast. Jimmy’s “The Saint” gangster career has finally ended. Yet now he finds him self doing favors for a wise godfather known as “The Man with the Plan.”', '/oPp6Gbrasox66WyMvPS0k8OakQf.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Crime', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Crime')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Antonia', 'After World War II, Antonia and her daughter, Danielle, go back to their Dutch hometown, where Antonia''s late mother has bestowed a small farm upon her. There, Antonia settles down and joins a tightly-knit but unusual community. Those around her include quirky friend Crooked Finger, would-be suitor Bas and, eventually for Antonia, a granddaughter and great-granddaughter who help create a strong family of empowered women.', '/nUCVi6bBIL7LGC61nYaCqikAhIA.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Once Upon a Time... When We Were Colored', 'This film relates the story of a tightly connected Afro-American community informally called Colored Town where the inhabitants live and depend on each other in a world where racist oppression is everywhere, as told by a boy called Cliff who spent his childhood there. Despite this, we see the life of the community in all its joys and sorrows, of those that live there while others decide to leave for a better life north. For those remaining, things come to a serious situation when one prominent businessman is being muscled out by a white competitor using racist intimidation. In response, the community must make the decision of whether to submit meekly like they always have, or finally fight for their rights.', '/45xucuNlia6vEPWYrYu2QlnwgpO.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Romance', now(), now()),('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Romance','Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    
insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Last Summer in the Hamptons', 'Filmed entirely on location in East Hampton, Long Island, "Last Summer in the Hamptons" concerns a large theatrical family spending the last weekend of their summer together at the decades-old family retreat which economic circumstances have forced them to put on the market. Victoria Foyt plays a young Hollywood actress whose visit wreaks havoc on the stellar group of family and friends - led by matriarch Viveca Lindfors and made up of an extraordinary mix of prominent New York actors, directors, and playwrights. In the course of a very unusual weekend, comic as well as serious situations arise, and the family''s secrets - of which there are many - begin to unravel.', '/g3m93gROYRRgu7lyQPzrka612uK.jpg' , '1995', now(), now()) returning id;

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Angels and Insects', 'In Victorian England, wealthy patriarch Sir Harald Alabaster invites an impoverished biologist, William Adamson, into his home. There, William tries to continue his work, but is distracted by Alabaster''s seductive daughter, Eugenia. William and Eugenia begin a torrid romance, but as the couple become closer, the young scientist begins to realize that dark, disturbing things are happening behind the closed doors of the Alabaster manor.', '/w1i5JdddoLuzSmnKo5ORDoKdMm2.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'White Squall', 'Teenage boys discover discipline and camaraderie on an ill-fated sailing voyage.', '/5xF4qy44Lvv68glS7eHWH7laTqt.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Dunston Checks In', 'Hotel manager Robert Grant is forced by his boss to postpone his family vacation when a hotel critic checks in. Trouble is, the critic is really a villainous jewel thief with an orangutan assistant named Dunston. When Dunston gets loose and tries to escape a life of crime -- aided by Robert''s sons -- havoc, hijinks and lots of laughs abound!', '/xR2cWC04kWNr7TBeXNOf4uOqn00.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Adventure', now(), now()),('Comedy', now(), now()),('Family', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Adventure','Comedy','Family')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Black Sheep', 'When dignified Albert Donnelly runs for Governor, his team moves to keep his slow-witted and klutzy younger brother, Mike, out of the eye of the media. To baby-sit Mike, the campaign assigns sarcastic Steve, who gets the experience of a lifetime when he tries to take Mike out of town during the election.', '/bV9SCk4QXCi9p1kdDBiYejcMQwK.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Nick of Time', 'Gene Watson is a public accountant who arrives on a train at Union Station in Los Angeles, accompanied by his 6-year-old daughter Lynn. Because of his ordinary looks, he is approached by a pair of sinister people named Smith and Jones.', '/A1FJwUVg84sQSjHVz5jVMXQvifJ.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Crime', now(), now()),('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Crime','Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'The Journey of August King', 'The Journey of August King is a multi-dimensional drama about a North Carolina farmer in 1815. August King, a widower, is on his way home as he does every year after selling his produce and purchasing the stock and goods he will need to survive the winter. On his journey, he comes upon a run-away slave, a young woman about 19 and August King must decide to violate the law and help this slave to freedom or else leave her to be hunted down and, ultimately, returned to her slave owner.', '/1kWPXnCyUo20QCrv8lwQhTFPj9f.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Mary Reilly', 'A housemaid falls in love with Dr. Jekyll and his darkly mysterious counterpart, Mr. Hyde.', '/eAOPWQdwytdRaLK3VXi7JFJFqmj.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Horror', now(), now()),('Thriller', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Horror','Thriller','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Vampire in Brooklyn', 'Maximillian, the lone survivor of a race of vampires, comes to Brooklyn in search of a way to live past the next full moon. His ticket to survival is Rita, a NYPD detective who doesn''t know she''s half vampire -- and Maximillian will do whatever''s necessary to put her under his spell.', '/i8ZD5LsBjwF45MsZ1nCClpvaOcn.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Horror', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Horror','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Beautiful Girls', 'During a snowy winter in the small fictional town of Knight"s Ridge, Massachusetts, a group of lifelong buddies hang out, drink and struggle to connect with the women who affect their decisions, dreams and desires.', '/sHcx1fBmrtZYvFmUywU0d5cvIFd.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Drama', now(), now()),('Romance', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Drama','Romance')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Broken Arrow', 'When rogue stealth-fighter pilot Vic Deakins deliberately drops off the radar while on maneuvers, the Air Force ends up with two stolen nuclear warheads -- and Deakins''s co-pilot, Riley Hale, is the military''s only hope for getting them back. Traversing the deserted canyons of Utah, Hale teams with park ranger Terry Carmichael to put Deakins back in his box.', '/iBPMwYYJFvdCBkXrwV75peo5Lz2.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()),('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure','Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'A Midwinter''s Tale', 'Out of work actor Joe volunteers to help try and save his sister''s local church for the community by putting on a Christmas production of Hamlet, somewhat against the advice of his agent Margaretta. As the cast he assembles are still available even at Christmas and are prepared to do it on a ''profit sharing'' basis (that is, they may not get paid anything) he cannot expect - and does not get - the cream of the cream. But although they all bring their own problems and foibles along, something bigger starts to emerge in the perhaps aptly named village of Hope.', '/cl5WtKNYL7porHGCroRTAKCGlTM.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'La Haine', 'Aimlessly whiling away their days in the concrete environs of their dead-end suburbia, Vinz, Hubert, and Said -- a Jew, African, and an Arab -- give human faces to France''s immigrant populations, their bristling resentment at their social marginalization slowly simmering until it reaches a climactic boiling point. La Haine means Hate.', '/bW4tXG8kZ89ZCurPnzDDSzJbeF5.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Shopping', 'A dark, hip, urban story of a barren and anonymous city where the underclass'' sport of choice is ram-raiding. An exciting game in which stolen cars are driven through shop windows to aid large-scale looting before the police arrive. For Tommy, it''s a business, but for Billy and Jo, it''s a labour of love. As the competition between Tommy and Billy grows more fierce, the stakes become higher and the "shopping" trips increasingly risky.', '/dIt1TZ2cVMIoz2sda8wDQ9OADDq.jpg', '1994', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Action', now(), now()),('Adventure', now(), now()),('Drama', now(), now()),('Science Fiction', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Action','Adventure','Drama','Science Fiction','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Heidi Fleiss: Hollywood Madam', 'A documentary crew from the BBC arrives in L.A. intent on interviewing Heidi Fleiss, a year after her arrest for running a brothel but before her trial. Several months elapse before the interview, so the crew searches for anyone who''ll talk about the young woman. Two people have a lot to say to the camera: a retired madam named Alex for whom Fleiss once worked and Fleiss''s one-time boyfriend, Ivan Nagy, who introduced her to Alex. Alex and Nagy don''t like each other, so the crew shuttles between them with "she said" and "he said." When they finally interview Fleiss, they spend their time reciting what Alex and Nagy have had to say and asking her reaction.', '/laPSb9I8TuYslOh1OcgaTByWKnw.jpg', '1995', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Documentary', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Documentary')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'City Hall', 'The accidental shooting of a boy in New York leads to an investigation by the Deputy Mayor, and unexpectedly far-reaching consequences.', '/g6JjdkmdElHIoNVaEso0BmjRDQT.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Drama', now(), now()),('Thriller', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Drama','Thriller')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    

    WITH  movies_insert AS
    (
        insert into movies(rating, name, description, cover_url, year, created_at, updated_at)  VALUES(0, 'Bottle Rocket', 'Upon his release from a mental hospital following a nervous breakdown, the directionless Anthony joins his friend Dignan, who seems far less sane than the former. Dignan has hatched a hair-brained scheme for an as-yet-unspecified crime spree that somehow involves his former boss, the (supposedly) legendary Mr. Henry.', '/6E7mJ5wpzTFbYFbJvTzzZ8Til9C.jpg', '1996', now(), now()) returning id
    ),
    genre_check AS 
    (
        insert into genre(type, created_at, updated_at) values('Comedy', now(), now()),('Crime', now(), now()),('Drama', now(), now()) on conflict (type) do nothing 
    ), available_genre AS(
    	select id from genre where type IN('Comedy','Crime','Drama')
    )
    insert into movie_genre(movie_id, genre_id, created_at, updated_at) select movies_insert.id, available_genre.id, now(), now() from movies_insert, available_genre;
    
