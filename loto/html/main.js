window.addEventListener('DOMContentLoaded', () => {

    //definition de variable
    max_number=3;//choose the number of case you want
    const container = document.getElementById('box_case');
    let htmlContent = '';

    window.addEventListener('message', (event) => {
        const data = event.data;
        if (data.action === "launch_loto") {
            document.body.style.display = "flex";
        }
    });

    for(let i = 0; i < max_number; i++){
        htmlContent += `
            <div class="box">
                <input type="text" class="case" id="case${i}" placeholder="Choose number ${i+1}">
            </div>`;
    }
    container.innerHTML = htmlContent;

    document.getElementById('validateBtn').addEventListener('click', () => {
        let inputValues = [];
        let last_case=document.getElementById(`last_case`).value;
        for(let i = 0; i < max_number; i++){
            case_select=document.getElementById(`case${i}`).value
            inputValues.push(case_select);
            case_select="";
                }

        inputValues.push(last_case);
        last_case="";
        document.body.style.display = "none";
        
        fetch(`https://${GetParentResourceName()}/close`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({valeurs: inputValues})
        });
    });
}
    
);



