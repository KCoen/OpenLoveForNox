using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NoxShared;
using MapEditor.xfer;
using System.Reflection;

namespace NoxShared
{
	class XfersHelper
	{
		public static Dictionary<string, Type> Xfers;
		static XfersHelper()
		{
			Xfers = new Dictionary<string, Type>();
			Xfers.Add("MonsterXfer", typeof(MonsterXfer));
			Xfers.Add("DoorXfer", typeof(DoorXfer));
			Xfers.Add("MonsterGeneratorXfer", typeof(MonsterXfer));
			Xfers.Add("ElevatorXfer", typeof(ElevatorXfer));
			Xfers.Add("ElevatorShaftXfer", typeof(ElevatorXfer));
			Xfers.Add("NPCXfer", typeof(NPCXfer));
			Xfers.Add("ReadableXfer", typeof(ReadableXfer));
			Xfers.Add("RewardMarkerXfer", typeof(RewardMarkerXfer));
			Xfers.Add("HoleXfer", typeof(HoleXfer));
			Xfers.Add("TransporterXfer", typeof(TransporterXfer));
			Xfers.Add("TriggerXfer", typeof(TriggerXfer));
			Xfers.Add("GoldXfer", typeof(GoldXfer));
			Xfers.Add("ObeliskXfer", typeof(ObeliskXfer));
			Xfers.Add("SentryXfer", typeof(SentryGlobeXfer));
			Xfers.Add("MoverXfer", typeof(MoverXfer));
			Xfers.Add("ExitXfer", typeof(ExitXfer));
			Xfers.Add("InvisibleLightXfer", typeof(InvisibleLightXfer));
		}

		public static Object GetXfer(string name, Map.Object mo)
		{
			if(Xfers.ContainsKey(name))
			{
				Type t = Xfers[name];
				Object o = Activator.CreateInstance(t);
				MethodInfo mi = t.GetMethod("FromMapObject");
				Object result = mi.Invoke(null, new object[] { mo });
				return result;
			}
			return null;
		}
	}
}