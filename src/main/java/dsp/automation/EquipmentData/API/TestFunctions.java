package dsp.automation.EquipmentData.API;

public class TestFunctions {

	static Common_methods_ED common = new Common_methods_ED();
	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		common.AssetTemplate("CAT", "A123", "113qwe", "2016", "O", "059956", "testasset", "", "TD00");
		common.getAuthorizationToken();
		common.addingHeaderstourl();
	}

}
