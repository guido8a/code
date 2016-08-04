<%--
  Created by IntelliJ IDEA.
  User: gato
  Date: 02/08/16
  Time: 11:31 AM
--%>

%{--<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">--}%
<div class="portfolio-modal modal fade in dialogo" aria-hidden="true" role="dialog" tabindex="-1" style="display: block; padding-right: 14px; overflow-y: auto" id="${art?.id}">
%{--<div class="portfolio-modal modal fade in dialogo" id="${art?.id}" tabindex="-1" role="dialog" aria-hidden="true">--}%



    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal" id="cerrarModal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body" style="text-align: justify">
                            <h2 style="text-align: center!important;">${art?.titulo}</h2>
                            <p class="item-intro text-muted" style="text-align: center">${art?.subtitulo}</p>
                            <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt="">
                            <p>${art?.descripcion}</p>
                            <p style="text-align: justify">  <util:renderHTML html="${art?.texto}"/></p>

                            %{--<ul class="list-inline">--}%
                                %{--<li>Date: July 2014</li>--}%
                                %{--<li>Client: Round Icons</li>--}%
                                %{--<li>Category: Graphic Design</li>--}%
                            %{--</ul>--}%
                            <button type="button" class="btn btn-primary"  data-dismiss="modal" id="btnCerrar"><i class="fa fa-times"></i> Cerrar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>

//    $("#cerrarModal").click(function () {
////        $("#modalArticulo").remove();
////        $("#modalArticulo").modal('toggle');
//        $("#modalArticulo").fadeOut();
//    });
//
//    $("#btnCerrar").click(function () {
//        $("#modalArticulo").fadeOut();
//    })

</script>



