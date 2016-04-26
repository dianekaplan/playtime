<?php if ($history == NULL) print("You have no transactions yet.  Click <a href='quote.php'>Quote</a> or <a href='buy.php'>Buy</a> to shop!"); ?>  

<?php if ($history != NULL) 
{?> 
<table class="table table-striped">

    <thead>
        <tr>
            <th>Transaction</th>
            <th>Date/Time</th>
            <th>Symbol</th>
            <th>Shares</th>
            <th>Price</th>
        </tr>
    </thead>

    <tbody>
        
        <!--I tried adding this to the #middle section in styles.css, but it didn't seem to take effect: th, td { text-align: left;}-->

        <?php foreach ($history as $transaction): ?>

        <tr>
            <?php if ($transaction["transaction_type"] == 1) print("<td align='left'>BUY</td>"); ?>
            <?php if ($transaction["transaction_type"] == 2) print("<td align='left'>SELL</td>"); ?>                
            <?php if ($transaction["transaction_type"] == 3) print("<td align='left'>DEPOSIT</td>"); ?>     
            
            <td align="left"><?= $transaction["datetime"] ?></td>
            <td align="left"><?= $transaction["symbol"] ?></td>
            <td align="left"><?= $transaction["shares"] ?></td>
            <td align="left">$<?= $transaction["share_price"] ?></td>
        </tr>
        <?php endforeach ?>
    

    </tbody>

</table>

<?php }?> 