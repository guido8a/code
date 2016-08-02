<%--
  Created by IntelliJ IDEA.
  User: gato
  Date: 02/08/16
  Time: 11:31 AM
--%>

%{--<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">--}%
<div id="link_${art?.id}" class="portfolio-modal modal fade in" aria-hidden="true" role="dialog" tabindex="-1" style="display: block; padding-right: 14px;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="close-modal" data-dismiss="modal">
                <div class="lr">
                    <div class="rl">
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-8 col-lg-offset-2">
                        <div class="modal-body">
                            <h2>${art?.titulo}</h2>
                            <p class="item-intro text-muted">${art?.subtitulo}</p>
                            <img class="img-responsive img-centered" src="img/portfolio/roundicons-free.png" alt="">
                            <p>${art?.descripcion}</p>
                            <p>
                                <strong>Want these icons in this portfolio item sample?</strong>You can download 60 of them for free, courtesy of <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">RoundIcons.com</a>, or you can purchase the 1500 icon set <a href="https://getdpd.com/cart/hoplink/18076?referrer=bvbo4kax5k8ogc">here</a>.</p>
                            <ul class="list-inline">
                                <li>Date: July 2014</li>
                                <li>Client: Round Icons</li>
                                <li>Category: Graphic Design</li>
                            </ul>
                            <button type="button" class="btn btn-primary"  data-dismiss="modal"><i class="fa fa-times"></i> Close Project</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


