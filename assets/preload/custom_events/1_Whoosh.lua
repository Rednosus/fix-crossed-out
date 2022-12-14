function onCreate()
	makeLuaSprite('WhooshWhite', 'WhooshWhite', 0, 0);
	setObjectCamera('WhooshWhite', 'camHUD');
    addLuaSprite('WhooshWhite', true);
        scaleObject('WhooshWhite', 10000, 10000)
	doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 0.001, 'linear');

    -- This is for Bendy's Ink notes,
    -- Why? you may aks?
    -- Well this Event is loaded and (for some reason) if I put this into the Note.lua thing, the note doesn't load soo....
 if not lowQuality then
    makeLuaSprite('InkSplash_Ink','InkSplash_Ink', 0, 0)
	setObjectCamera('InkSplash_Ink', 'other');
	doTweenAlpha('InkSplash_Ink', 'InkSplash_Ink', 0, 0.01, 'linear');
	addLuaSprite('InkSplash_Ink', true)
        scaleObject('InkSplash_Ink', 4, 4)
 end
end

function onEvent(name, value1, value2)
	if name == '1_Whoosh' then
        WhooshVariant = value1     
        if WhooshVariant == '1' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 1, 0.001, 'linear'); 
	        runTimer('EndWhooshWhite', 0.1);
        elseif WhooshVariant == '0' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 1, 0.001, 'linear'); 
            runTimer('EndWhooshWhite', 0.001);
        elseif WhooshVariant == '2' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 1, 0.001, 'linear'); 
            runTimer('EndWhooshWhite', 0.2);
        elseif WhooshVariant == '3' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 1, 0.001, 'linear'); 
            runTimer('EndWhooshWhite', 0.1);
        elseif WhooshVariant == 'Dark' then
            addLuaSprite('BendyStage_Transition', false)
            objectPlayAnimation('BendyStage_Transition','beb instance ', true)
        elseif WhooshVariant == 'Dark2' then
            objectPlayAnimation('BendyStage_Transition','beb instance ', true)
        elseif WhooshVariant == 'DarkRemove' then
            removeLuaSprite('BendyStage_Transition', true)
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'EndWhooshWhite' then
        if WhooshVariant == '1' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 1, 'linear');
        elseif WhooshVariant == '0' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 0.01, 'linear');
        elseif WhooshVariant == '2' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 2, 'linear');
        elseif WhooshVariant == '3' then
            doTweenAlpha('WhooshWhite', 'WhooshWhite', 0, 2, 'linear');
        end
    end
end