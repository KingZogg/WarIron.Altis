// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
#include "goldbuyerDefines.sqf"

#define GoldBuyerButton_textSize (0.04 * TEXT_SCALE)

class goldbuyerd
{
	idd = goldbuyer_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "[0] execVM 'client\systems\goldbuyer\populateGoldBuyer.sqf'";

	class ControlsBackground
	{
		#define GoldBuyerMainBG_W (0.7333 * SZ_SCALE)
		#define GoldBuyerMainBG_H (0.65 * SZ_SCALE)
		#define GoldBuyerMainBG_X CENTER(1, GoldBuyerMainBG_W)
		#define GoldBuyerMainBG_Y CENTER(1, GoldBuyerMainBG_H)

		class MainBackground: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0, 0, 0, 0.6};
			moving = true;

			x = GoldBuyerMainBG_X;
			y = GoldBuyerMainBG_Y;
			w = GoldBuyerMainBG_W;
			h = GoldBuyerMainBG_H;
		};

		class TopBar: IGUIBack
		{
			idc = -1;
			colorBackground[] = {0.25, 0.51, 0.96, 0.8};

			#define GoldBuyerTopBar_H (0.05 * SZ_SCALE)
			
			x = GoldBuyerMainBG_X;
			y = GoldBuyerMainBG_Y;
			w = GoldBuyerMainBG_W;
			h = GoldBuyerTopBar_H;
		};

		class DialogTitleText: w_RscTextCenter
		{
			idc = -1;
			text = "Gold Buyer";
			sizeEx = 0.06 * TEXT_SCALE;

			x = GoldBuyerMainBG_X;
			y = GoldBuyerMainBG_Y;
			w = GoldBuyerMainBG_W;
			h = GoldBuyerTopBar_H;
		};

		
		class PlayerMoneyText: w_RscText
		{
			idc = goldbuyer_money;
			text = "Cash:";
			sizeEx = 0.04 * TEXT_SCALE;

			x = GoldBuyerMainBG_X + (0.6033 * SZ_SCALE);
			y = GoldBuyerMainBG_Y + (0.005 * SZ_SCALE);
			w = 0.1126 * SZ_SCALE;
			h = 0.0448 * SZ_SCALE;
		};
		

		class ItemSelectedPrice: w_RscStructuredTextLeft
		{
			idc = goldbuyer_item_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = GoldBuyerMainBG_X + (0.15 * SZ_SCALE);
			y = GoldbuyerMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};

		class SellSelectedPrice: w_RscStructuredTextLeft
		{
			idc = goldbuyer_sell_TEXT;
			size = 0.04 * TEXT_SCALE;

			x = GoldbuyerMainBG_X + (0.439 * SZ_SCALE);
			y = GoldbuyerMainBG_Y + (0.514 * SZ_SCALE);
			w = 0.119 * SZ_SCALE;
			h = 0.0689 * SZ_SCALE;
		};
	};

	class Controls
	{

		class SellList: w_RscList
		{
			idc = goldbuyer_sell_list;
			onLBSelChanged = "[] execVM 'client\systems\goldbuyer\sellInfo.sqf'";
			sizeEx = 0.04 * TEXT_SCALE;
			rowHeight = 0.04 * TEXT_SCALE;

			x = GoldBuyerMainBG_X + (0.4433 * SZ_SCALE);
			y = GoldBuyerMainBG_Y + (0.075 * SZ_SCALE);
			w = 0.276 * SZ_SCALE;
			h = 0.4222 * SZ_SCALE;
		};

		class SellItem: w_RscButton
		{
			idc = goldbuyer_sell;
			onButtonClick = "[0] execVM 'client\systems\goldbuyer\sellItems.sqf'";
			text = "Sell";
			sizeEx = GoldBuyerButton_textSize;

			x = GoldBuyerMainBG_X + (0.6233 * SZ_SCALE);
			y = GoldBuyerMainBG_Y + (0.507 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};

		class CancelButton: w_RscButton
		{
			idc = -1;
			onButtonClick = "closeDialog 0";
			text = "Cancel";
			sizeEx = GoldBuyerButton_textSize;

			x = GoldBuyerMainBG_X + (0.0167 * SZ_SCALE);
			y = GoldBuyerMainBG_Y + (0.59 * SZ_SCALE);
			w = 0.096 * SZ_SCALE;
			h = 0.040 * SZ_SCALE;
		};
	};
};

