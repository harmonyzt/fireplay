#include <amxmodx>
#include <fakemeta>

new const PLUGIN[] = "Damager"
new const VERSION[] = "1.0"
new const AUTHOR[] = "None"

new g_MsgSync
new g_MsgSync2

new pid
new damage

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	register_event("Damage", "EVENT_Damage", "b", "2!0", "3=0", "4!0")
	
	g_MsgSync = CreateHudSyncObj()
	g_MsgSync2 = CreateHudSyncObj()
}

public EVENT_Damage(id)
{ 
	if(pev_valid(id))
	{
		pid = get_user_attacker(id)
		damage = read_data(2)
		
		set_hudmessage(255, 0, 0, 0.45, 0.50, 2, 0.1, 4.0, 0.1, 0.1, -1)
		ShowSyncHudMsg(id, g_MsgSync2, "%i", damage)
		
		if(pev(pid, pev_flags) & FL_CLIENT)
		{
			set_hudmessage(0, 100, 200, -1.0, 0.55, 2, 0.1, 4.0, 0.02, 0.02, -1)
			ShowSyncHudMsg(pid, g_MsgSync, "%i", damage)
		}
	}
}
