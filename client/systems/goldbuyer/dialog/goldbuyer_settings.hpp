// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "goldbuyerDefines.sqf"

#define goldbuyerButton_textSize (0.04 * TEXT_SCALE)

class goldbuyerd
{
	idd = goldbuyer_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[[0], populateGoldBuyer] execFSM 'call.fsm'";
	
	class ControlsBackground
	{
		#define goldbuyerMainBG_W (0.7333 * SZ_SCALE)
		#define goldbuyerMainBG_H (0.65 * SZ_SCALE)
		#define goldbuyerMainBG_X CENTER(1, goldbuyerMainBG_W)
		#define goldbuyerMainBG_Y CENTER(1, goldbuyerMainBG_H)

		class MainBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.6};
			moving = true;

			x = goldbuyerMainBG_X;
			y = goldbuyerMainBG_Y;
			w = goldbuyerMainBG_W;
			h = goldbuyerMainBG_H;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0.25, 0.51, 0.96, 0.8};

			#define goldbuyerTopBar_H (0.05 * SZ_SCALE)

			x = goldbuyerMainBG_X;
			y = goldbuyerMainBG_Y;
			w = goldbuyerMainBG_W;
			h = goldbuyerTopBar_H;
		};

		class DialogTitleText: w_RscTextCenter
		{
			idc = -1;
			text = "Gold Trader";
			sizeEx = 0.06 * TEXT_SCALE;

			x = goldbuyerMainBG_X;
			y = goldbuyerMainBG_Y;
			w = goldbuyerMainBG_W;
			h = goldbuyerTopBar_H;
		};

		/*
		class PlayerMoneyText: w_RscText
		{
			idc = goldbuyer_money;
			text = "Cash:";
			sizeEx = 0.04 * TEXT_SCALE;

			x = goldbuyerMainBG_X + (0.6033 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.005 * SZ_SCALE);
			w = 0.1126 * SZ_SCALE;
			h = 0.0448 * SZ_SCALE;
		};
		*/

		class ItemSelectedPrice: w_RscStructuredTextLeft
		{
			idc = goldbuyer_item_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = goldbuyerMainBG_X + (0.15 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};

		class SellSelectedPrice: w_RscStructuredTextLeft
		{
			idc = goldbuyer_sell_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = goldbuyerMainBG_X + (0.439 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};
	};

	class Controls
	{
		class SelectionList: w_RscList
		{
			idc = goldbuyer_item_list;
			onLBSelChanged = "[] execVM 'client\systems\goldbuyer\itemInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;

			x = goldbuyerMainBG_X + (0.1533 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.3382 * SZ_SCALE;
		};

		class ItemDescription: w_RscStructuredTextLeft
		{
			idc = goldbuyer_item_desc;
			size = 0.04 * TEXT_SCALE;
			colorBackground[] = {0, 0, 0, 0.3};

			x = goldbuyerMainBG_X + (0.1533 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.417 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.088 * SZ_SCALE;
		};

		class SellList: w_RscList
		{
			idc = goldbuyer_sell_list;
			onLBSelChanged = "[] execVM 'client\systems\goldbuyer\sellInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.05 * TEXT_SCALE;

			x = goldbuyerMainBG_X + (0.4433 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.4222 * SZ_SCALE;
		};

		class BuyItem: w_RscButton
		{
			idc = -1;
			action = "[0] execVM 'client\systems\goldbuyer\buyItems.sqf'";
			text = "Buy";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.334 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellItem: w_RscButton
		{
			idc = goldbuyer_sell;
			action = "[0] execVM 'client\systems\goldbuyer\sellItems.sqf'";
			text = "Sell";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.6233 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

/*
		class StoreButton0: w_RscButton
		{
			idc = -1;
			action = "[0] call populateGoldBuyer";
			text = "Headgear";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton1: w_RscButton
		{
			idc = -1;
			action = "[1] call populateGoldBuyer";
			text = "Uniforms";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.125 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton2: w_RscButton
		{
			idc = -1;
			action = "[2] call populateGoldBuyer";
			text = "Vests";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.175 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton3: w_RscButton
		{
			idc = -1;
			action = "[3] call populateGoldBuyer";
			text = "Backpacks";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.225 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class StoreButton4: w_RscButton
		{
			idc = -1;
			action = "[4] call populateGoldBuyer";
			text = "Items";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.275 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
*/
		class StoreButton5: w_RscButton
		{
			idc = -1;
			action = "[0] call populateGoldBuyer";
			text = "Black Market";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
/*
		class StoreButton6: w_RscButton
		{
			idc = -1;
			action = "[6] call populateGoldBuyer";
			text = "Objects";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.375 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellWeapon: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellWeapon.sqf'";
			text = "Sell Weapon";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.23 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellUniform: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellUniform.sqf'";
			text = "Sell Uniform";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + ((0.604 - 0.25) * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellVest: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellVest.sqf'";
			text = "Sell Vest";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.478 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class SellBackpack: w_RscButton
		{
			idc = -1;
			action = "[] execVM 'client\systems\selling\sellBackpack.sqf'";
			text = "Sell Backpack";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.602 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.1173 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
*/
		class CancelButton: w_RscButton
		{
			idc = -1;
			action = "closeDialog 0";
			text = "Cancel";
			sizeEx = goldbuyerButton_textSize;

			x = goldbuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = goldbuyerMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
	};
};

