namespace CyberpunkServer.Models.DTO
{
	public partial interface NetItem
	{
		int id { get; set; }
		int xPos { get; set; }
		int yPos { get; set; }
		NetObjTypeData NetObjType { get; set; }
	}
	public interface RunningProgram: CyberpunkServer.Models.DTO.NetItem
	{
        ProgramData Program { get; set; }
        int Strength { get; set; }
        bool Rezzed { get; set; }
        int? OwnerID { get; set; }
        bool Packed { get; set; }
        int xPos { get; set; }
        int yPos { get; set; }
        int id { get; set; }
        int DeviceID { get; set; }
        string DeviceType { get; set; }
        int MU { get; }
        string UUID { get; set; }
    }
}
