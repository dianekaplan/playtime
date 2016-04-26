<p>Your current balance is = <b>$<?= $balance ?></b></p>

<p>To add more, request it here:</p>
<form action="add_cash.php" method="post">
    <fieldset>

        <div class="form-group">
            <input class="form-control" name="amount" placeholder="Enter amount here" type="text"/><br/>
        </div>
        <div class="form-group">
            <button class="btn btn-default" type="submit">
                <span aria-hidden="true" class="glyphicon glyphicon-log-in"></span>
                Add cash now
            </button>
        </div>
    </fieldset>
</form>
