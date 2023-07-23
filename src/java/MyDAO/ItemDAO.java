/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyDAO;

import MyDTO.Item;
import MyDTO.Plant;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ItemDAO {

    public static boolean checkCartItem(ArrayList<Item> listI, String name) throws Exception {
        for (Item item : listI) {
            if (item.getPlant().getName().equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    public static int checkIndexCartItem(ArrayList<Item> listI, String name) throws Exception {
        for (int i = 0; i < listI.size(); i++) {
            if (listI.get(i).getPlant().getName().equalsIgnoreCase(name)) {
                return i;
            }
        }
        return -1;
    }

    public static ArrayList<Item> updateCartItem(ArrayList<Item> listI, String name, int quantity) throws Exception {
        for (Item item : listI) {
            if (item.getPlant().getName().equalsIgnoreCase(name)) {
                item.setQuantity(item.getQuantity() + quantity);
            }
        }
        return listI;
    }

    public static ArrayList<Item> addCartItem(ArrayList<Item> listI, String name, int quantity) throws Exception {
        ArrayList<Plant> listP = PlantDAO.listPlantCartSearch(name);
        Plant p = listP.get(0);
        Item i = new Item(p, quantity);
        listI.add(i);
        return listI;
    }

    public static ArrayList<Item> addBeginCartItem(ArrayList<Item> listI, String name, int quantity) throws Exception {
        listI = new ArrayList<>();
        ArrayList<Plant> listP = PlantDAO.listPlantCartSearch(name);
        Plant p = listP.get(0);
        Item i = new Item(p, quantity);
        listI.add(i);
        return listI;
    }

    public static ArrayList<Item> removeCartItem(ArrayList<Item> listI, String name) throws Exception {
        ArrayList<Plant> listP = PlantDAO.listPlantSearch(name);
        int pos = checkIndexCartItem(listI, name);
        listI.remove(pos);
        return listI;
    }

    
}
