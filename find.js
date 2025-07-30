async function fetchData() {

    let pokemonName = document.getElementById('pokemon').value.toLowerCase();
    let response = await fetch (`https://pokeapi.co/api/v2/pokemon/${pokemonName}`);

    try{
        if (!response.ok){
            throw new Error("Pokémon not found");
        }
        
        let data = await response.json();
        let name = data.name;
        let weight = data.weight;
        document.getElementById('name').innerText = `Name: ${name}`;
        document.getElementById('weight').innerText = `Weight: ${weight}`;

        let pokemonImg = data.sprites.front_default;
        let img = document.getElementById('img');
        img.style.display = "block";
        img.src = pokemonImg;
    }
    catch (error){
        console.error(error);
    }
}