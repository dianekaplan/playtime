
<table class="table table-striped">

    <thead>
        <tr>
            <th>Symbol</th>
            <th>Name</th>
            <th>Shares</th>
            <th>Price</th>
            <th>TOTAL</th>
        </tr>
    </thead>

    <tbody>
        
        <!--I tried adding this to the #middle section in styles.css, but it didn't seem to take effect: th, td { text-align: left;}-->

        <?php foreach ($positions as $position): ?>
        <tr>
            <td align="left"><?= $position["symbol"] ?></td>
            <td align="left"><?= $position["name"] ?></td>
            <td align="left"><?= $position["shares"] ?></td>
            <td align="left">$<?= $position["price"] ?></td>
            <td align="left">$<?= number_format(($position["shares"] * $position["price"]), 2) ?></td>
        </tr>
        <?php endforeach ?>
    
        <tr>
            <td colspan="4" align="left">CASH</td>
            <td align="left">$<?= $balance?> </td>
        </tr>

    </tbody>

</table>


