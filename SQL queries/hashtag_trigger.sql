



DELIMITER // 

CREATE TRIGGER `hashtag_finder` AFTER INSERT 
ON avas FOR EACH ROW
BEGIN 

    -- hold a copy of new added ava
    SET @`cpy` = NEW.ava;


    `try`: LOOP

        SET @`indx` = locate('#', @cpy); -- find the position of '#' symbol
        SET @`hashtag` = substr(@cpy, (@indx)+1, 5); -- find the hashtag
	
        
        -- check pattern
        IF (@hashtag REGEXP '^[a-z][a-z][a-z][a-z][a-z]$') 
        THEN
			-- check that we have add this hashtag befor or not
			IF @hashtag NOT IN (SELECT h.hashtag FROM hashtags h)
            THEN
				-- add new hashtag
                INSERT INTO hashtags VALUE (DEFAULT, @hashtag);
			END IF;
            
			-- add the hashtag of ava
            INSERT INTO avas_hashtags VALUE (NEW.id, hashtagID(@hashtag));
            
		END IF;
        
        
		-- remove added hashtag
        SET @cpy = substr(@cpy, @indx+1, length(@cpy)+2);
        
        
        -- check that we have another hashtag or not
        IF locate('#', @cpy) != 0
        THEN
			ITERATE try;
		END IF;
        
        
		LEAVE try;
	END LOOP try;

END;
        
        
			
        
        







