//Please check the svencoop/scripts/plugin/carioConfig/modelList.txt for instructions

void PluginInit() {

	g_Module.ScriptInfo.SetAuthor("Dhalucario");
	g_Module.ScriptInfo.SetContactInfo("Telegram: @yesthisiscario");

}

void MapInit() {

	File@ modelList = g_FileSystem.OpenFile("scripts/plugins/carioConfig/modelList.txt", OpenFile::READ);
	
	if(modelList !is null && modelList.IsOpen()) {

		while (!modelList.EOFReached()) {

			string txtLine = "";
			modelList.ReadLine(txtLine);

			if (txtLine.SubString(0,1) == "#" || txtLine.IsEmpty()) { continue; }

			g_Game.PrecacheGeneric("models/player/" + txtLine + "/" + txtLine + ".mdl");
			g_Game.PrecacheModel("models/player/" + txtLine + "/" + txtLine + ".mdl");

		}

	}
	
	modelList.Close();
}
