def test_show_frontend(client):
    response = client.get("/")
    assert response.status_code == 200
    assert b"mainpage" in response.data.lower()
