void PluginInit() {
	g_Module.ScriptInfo.SetAuthor("Dhalucario");
	g_Module.ScriptInfo.SetContactInfo("Telegram: @yesthisiscario");
	g_Hooks.RegisterHook( Hooks::Player::PlayerPreThink, @PlayerPreThink );
}

HookReturnCode PlayerPreThink( CBasePlayer@ pPlayer, uint& out uiFlags )
{
	if( (pPlayer.pev.button & IN_JUMP) != 0 ) {
		int flags = pPlayer.pev.flags;

		if( (flags & FL_WATERJUMP) != 0 )
			return HOOK_CONTINUE;

		if( pPlayer.pev.waterlevel >= WATERLEVEL_WAIST )
			return HOOK_CONTINUE;

		if( (flags & FL_ONGROUND) == 0 )
			return HOOK_CONTINUE;
			
		if (!pPlayer.isAlive())
			return HOOK_CONTINUE;

		// Code from: https://steamcommunity.com/groups/SvenCoop/discussions/0/359543542246728102/ by Nero
		Vector velocity = pPlayer.pev.velocity;
		velocity.z += sqrt(2 * 800 * 45.0f);
		pPlayer.pev.velocity = velocity;

		pPlayer.pev.gaitsequence = 6;
		
	}

	return HOOK_CONTINUE;
} 