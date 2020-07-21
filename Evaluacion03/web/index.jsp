<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script defer src="https://use.fontawesome.com/releases/v5.3.1/js/all.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.0/css/bulma.min.css">
        <title>index</title>
    </head>
    <body>
        <nav class="navbar is-info" role="navigation" aria-label="main navigation">
            <div id="navbarBasicExample" class="navbar-menu">
              <div class="navbar-start">
                <a href="login.jsp" class="navbar-item ">
                    ADMIN
                </a>
              </div>
              <div class="navbar-end">
                <a class="navbar-item" href="index.jsp">
                    PRODUCTOS
                </a>
                <div class="navbar-item">
                    
                    <div class="field has-addons">
                        <div class="control">
                          <input class="input" type="text" placeholder="Correo electrónico">
                        </div>
                        <div class="control">
                          <a class="button is-primary">
                            BUSCAR PEDIDOS
                          </a>
                        </div>
                    </div>
                </div>
              </div>
            </div>
        </nav>
        
        <div class="container">  
            <div class="columns">
                <div class="column is-three-quarters">
                    <h1 class="title">Productos</h1>
                    <table class="table">
                        <thead>
                          <tr>
                            <th><abbr title="Código de producto">Cod</abbr></th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th><abbr title="Precio unitario">Pre. Unit.</abbr></th>
                            <th>Cantidad</th>
                            <th>Subtotal</th>
                            <th>Comprar</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <th>1</th>
                            <td><a href="https://en.wikipedia.org/wiki/Leicester_City_F.C." title="Leicester City F.C.">Leicester City</a> <strong>(C)</strong>
                            </td>
                            <td>38</td>
                            <td>23</td>
                            <td>12</td>
                            <td>68</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Champions_League#Group_stage" title="2016?17 UEFA Champions League">Champions League group stage</a></td>
                          </tr>
                          <tr>
                            <th>2</th>
                            <td><a href="https://en.wikipedia.org/wiki/Arsenal_F.C." title="Arsenal F.C.">Arsenal</a></td>
                            <td>38</td>
                            <td>20</td>
                            <td>7</td>
                            <td>65</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Champions_League#Group_stage" title="2016?17 UEFA Champions League">Champions League group stage</a></td>
                          </tr>
                          <tr>
                            <th>3</th>
                            <td><a href="https://en.wikipedia.org/wiki/Tottenham_Hotspur_F.C." title="Tottenham Hotspur F.C.">Tottenham Hotspur</a></td>
                            <td>38</td>
                            <td>19</td>
                            <td>6</td>
                            <td>69</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Champions_League#Group_stage" title="2016?17 UEFA Champions League">Champions League group stage</a></td>
                          </tr>
                          <tr class="is-selected">
                            <th>4</th>
                            <td><a href="https://en.wikipedia.org/wiki/Manchester_City_F.C." title="Manchester City F.C.">Manchester City</a></td>
                            <td>38</td>
                            <td>19</td>
                            <td>10</td>
                            <td>71</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Champions_League#Play-off_round" title="2016?17 UEFA Champions League">Champions League play-off round</a></td>
                          </tr>
                          <tr>
                            <th>5</th>
                            <td><a href="https://en.wikipedia.org/wiki/Manchester_United_F.C." title="Manchester United F.C.">Manchester United</a></td>
                            <td>38</td>
                            <td>9</td>
                            <td>10</td>
                            <td>49</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Europa_League#Group_stage" title="2016?17 UEFA Europa League">Europa League group stage</a></td>
                          </tr>
                          <tr>
                            <th>6</th>
                            <td><a href="https://en.wikipedia.org/wiki/Southampton_F.C." title="Southampton F.C.">Southampton</a></td>
                            <td>38</td>
                            <td>9</td>
                            <td>11</td>
                            <td>59</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Europa_League#Group_stage" title="2016?17 UEFA Europa League">Europa League group stage</a></td>
                          </tr>
                          <tr>
                            <th>6</th>
                            <td><a href="https://en.wikipedia.org/wiki/Southampton_F.C." title="Southampton F.C.">Southampton</a></td>
                            <td>38</td>
                            <td>18</td>
                            <td>9</td>
                            <td>59</td>
                            <td>Qualification for the <a href="https://en.wikipedia.org/wiki/2016%E2%80%9317_UEFA_Europa_League#Group_stage" title="2016?17 UEFA Europa League">Europa League group stage</a></td>
                          </tr>
                        </tbody>
                      </table>
                </div>
                <div class="column">
                    <div class="notification is-primary is-light">
                        <h2 class="subtitle">Carro de compras</h2>
                    </div>   
                </div>
              </div>
        </div>
    </body>
</html>
