



DELIMITER // 

CREATE TRIGGER `hashtag_finder` AFTER INSERT 
ON avas FOR EACH ROW
BEGIN 

    -- hold a copy of new added ava
    SET @`cpy` = NEW.ava;
    insert into loghold value (@cpy, 'ava cpy');


    `try`: LOOP

        SET @`indx` = locate('#', @cpy); -- find the position of '#' symbol
        insert into loghold value (@indx, '# index');
        SET @`hashtag` = substr(@cpy, @indx+1, @indx+4); -- find the hashtag
        insert into loghold value (@hashtag, 'hashtag');
	
        
        -- check pattern
        IF (@hashtag REGEXP '^[a-z][a-z][a-z][a-z][a-z]$') 
        THEN
			insert into loghold value ('if first if', '1st hashtag');
			-- check that we have add this hashtag befor or not
			IF @hashtag NOT IN (SELECT hashtag FROM hashtags)
            THEN
				insert into loghold value ('second if', '');
				-- add new hashtag
                INSERT INTO hashtags VALUE (DEFAULT, @hashtag);
			END IF;
            
            insert into loghold value ('befor add ava hashtag', '');
			-- add the hashtag of ava
            INSERT INTO avas_hashtags VALUE (NEW.id, hashtagID(@hashtag));
            
		END IF;
        
        
		-- remove added hashtag
        SET @cpy = substr(@cpy, @indx+1, length(@cpy)+2);
        insert into loghold value (@cpy, 'new cpy');
        
        
        -- check that we have another hashtag or not
        IF locate('#', @cpy) != 0
        THEN
			insert into loghold value ('repeat loop', '');
			ITERATE try;
		END IF;
        
        insert into loghold value ('leave lopp', '');
		LEAVE try;
	END LOOP try;

END;
        
        
			
        
        







