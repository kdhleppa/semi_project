package edu.kh.semiproject.map.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import edu.kh.semiproject.map.model.dao.MapDAO;
import edu.kh.semiproject.product.model.dto.Product;

@Service
public class MapServiceImpl implements MapService{

	
	@Autowired
	private MapDAO dao;

	@Override
	public List<Product> selectAllProduct() {
		
		return dao.selectAllProduct();
	}
/*
	@Override
	public List<Product> selectProductsInBounds(double southWestLat, double southWestLng, double northEastLat,
			double northEastLng) {
		return null;
	}
*/
/*
	@Value("cb9b63d71a5408fd96cba9a1674b9d43")  // This should be added to application.properties or application.yml
    private String KAKAO_API_KEY;
    
    public HashMap<String, Double> convertAddressToCoords(String address) {
        RestTemplate restTemplate = new RestTemplate();
        String apiURL = "https://dapi.kakao.com/v2/local/search/address.json?query=" + address;
        
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + KAKAO_API_KEY);
        
        HttpEntity<String> entity = new HttpEntity<>(headers);
        
        ResponseEntity<String> response = restTemplate.exchange(apiURL, HttpMethod.GET, entity, String.class);
        
        // Parse the response to extract latitude and longitude (this is a simple representation)
        JSONObject jsonResponse = new JSONObject(response.getBody());
        double latitude = jsonResponse.getJSONArray("documents").getJSONObject(0).getJSONObject("address").getDouble("y");
        double longitude = jsonResponse.getJSONArray("documents").getJSONObject(0).getJSONObject("address").getDouble("x");
        
        HashMap<String, Double> coords = new HashMap<>();
        coords.put("latitude", latitude);
        coords.put("longitude", longitude);
        
        return coords;
    }
	
	*/

}
