require "InventoryTetris/TetrisItemData";
require "InventoryTetris/TetrisContainerData";

TetrisItemPackLoader = {}
TetrisItemPackLoader.__index = TetrisItemPackLoader

local function ApplyItemParams(itemId, defX)
    if not isServer() then return end
    local params = defX["bsm.params"]
    if type(params) ~= "table" then return end

    local item = ScriptManager.instance:getItem(itemId)
    if not item then return end

    for k, v in pairs(params) do
        item:DoParam(k .. " = " .. tostring(v))
    end
end

local LoadPacks = function(packFiles)
    local itemPack = {}

    for _, packFile in ipairs(packFiles) do
        local ok, pack = pcall(require, packFile)
        if not ok or type(pack) ~= "table" then
            DebugLog.log("[Tetris] ✗ Failed to load " .. tostring(packFile))
        else
            for baseItem, def in pairs(pack) do
                if type(baseItem) == "string" and type(def) == "table" then
                    
                    -- copy base definition
                    local function splinterDefinition(def)
                        local out = {
                            ["tetris"] = {}
                        }
                    
                        for k, v in pairs(def) do
                            if type(k) == "string" and k:match("^bsm%.") then
                                -- keep metadata as-is
                                out[k] = v
                            else
                                -- runtime properties
                                out["tetris"][k] = v
                            end
                        end
                    
                        return out
                    end
                    local defX = splinterDefinition(def)
                    itemPack[baseItem] = defX["tetris"];
                    ApplyItemParams(baseItem, defX);
                    -- expand aliases
                    local aliases = defX["bsm.alias"]
                    if type(aliases) == "table" then
                        for _, aliasItem in ipairs(aliases) do
                            itemPack[aliasItem] = defX.tetris
                            ApplyItemParams(aliasItem, defX);
                        end
                    end
                end
            end
        end
    end

    return itemPack
end


TetrisItemPackLoader.LoadAllItems = function()
    local ok, packFiles = pcall(require, "InventoryTetris/ImportItemsFiles");
    if not ok or type(packFiles) ~= "table" then
        DebugLog.log("[Tetris] ✗ Failed to load " .. tostring(packFiles));
        return;
    end
    local itemPack = LoadPacks(packFiles)
    TetrisItemData.registerItemDefinitions(itemPack)
    DebugLog.log(DebugType.Lua,"[Tetris] ✓ Registered items")
end


TetrisItemPackLoader.LoadAllContainers = function()
    local ok, packFiles = pcall(require, "InventoryTetris/ImportContainerFiles");
    if not ok or type(packFiles) ~= "table" then
        DebugLog.log("[Tetris] ✗ Failed to load " .. tostring(packFiles));
        return;
    end
    local containerPack = LoadPacks(packFiles)
    TetrisContainerData.registerContainerDefinitions(containerPack)
    DebugLog.log(DebugType.Lua,"[Tetris] ✓ Registered containers")
end


-- getPlayer():getInventory():AddItem("Base.Bag_Schoolbag")
-- getPlayer():getInventory():AddItem("Base.Bag_NormalHikingBag")
-- getPlayer():getInventory():AddItem("Base.Bag_BigHikingBag")
-- getPlayer():getInventory():AddItem("Base.Bag_DuffelBag")
-- getPlayer():getInventory():AddItem("Base.Bag_Satchel")
-- getPlayer():getInventory():AddItem("Base.Bag_ALICEpack")
-- getPlayer():getInventory():AddItem("Base.Bag_ALICEpack_Army")
-- getPlayer():getInventory():AddItem("Base.Bag_GolfBag")
-- getPlayer():getInventory():AddItem("Base.Garbagebag")
-- getPlayer():getInventory():AddItem("Base.Plasticbag")
-- getPlayer():getInventory():AddItem("Base.Handbag")
-- getPlayer():getInventory():AddItem("Base.Purse")