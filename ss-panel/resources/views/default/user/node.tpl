{include file='user/main.tpl'}

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            节点列表
            <small>Node List</small>
        </h1>
    </section>

    <!-- Main content -->
    <section class="content">
        <!-- START PROGRESS BARS -->
        <div class="row">
            <div class="col-md-12">
                <div class="callout callout-warning">
                    <h4>注意!</h4>
                    <p>请勿在任何地方公开节点地址！</p>
					<p>IPv6校内使用效果较好，IPv4供校外或者外出开会使用.</p>
					<p>备用节点仅供紧急情况使用.</p>
                    {$msg}
                </div>
            </div>
        </div>

        {foreach $nodes as $node}
            <div class="row">
                <div class="col-md-12">
                    <div class="box box-widget">
                        <div class="box-body">
                            <ul class="products-list product-list-in-box">
                                <li class="item">
                                    <div class="product-img">
                                        <img src="../assets/public/img/iconfont-server.png" alt="Server Node">
                                    </div>
                                    <div class="product-info">
                                        <a href="./node/{$node->id}" class="product-title">{$node->name} <span
                                                    class="label label-info pull-right">{$node->status}</span></a>
                                        <p>
                                            {$node->info}
                                        </p>
                                    </div>
                                </li><!-- /.item -->
                            </ul>
                        </div>
                        <div class="box-footer no-padding">
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="nav nav-stacked">
                                        <li><a href="./node/{$node->id}">节点地址 <span
                                                        class="pull-right badge bg-blue">{$node->server}</span></a></li>
                                        <li><a href="./node/{$node->id}">连接端口 <span
                                                        class="pull-right badge bg-aqua">{if (($node->id==5)||($node->id==6))} {'37001'} {else} {$user->port}{/if}</span></a></li>
                                        <li><a href="./node/{$node->id}">加密方式 <span
                                                        class="pull-right badge bg-green">{if $node->custom_method == 1} {$user->method} {else} {$node->method} {/if}</span></a>
                                        </li>
                                        <li><a href="./node/{$node->id}">负载: <span
                                                        class="pull-right badge bg-green">{if (($node->id==5)||($node->id==6))} {'0'} {else} {$node->getNodeLoad()} {/if}</span></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="nav nav-stacked">
                                        <li><a href="./node/{$node->id}">流量比例 <span
                                                        class="pull-right badge bg-blue">{$node->traffic_rate}</span></a>
                                        </li>
                                        <li><a href="./node/{$node->id}">在线人数 <span
                                                        class="pull-right badge bg-aqua">{if (($node->id==5)||($node->id==6))}{'0'}{else}{$node->getOnlineUserCount()}{/if}</span></a>
                                        </li>
                                        <li><a href="./node/{$node->id}">产生流量 <span
                                                        class="pull-right badge bg-green">{if (($node->id==5)||($node->id==6))}{'0'}{else}{$node->getTrafficFromLogs()}{/if}</span></a>
                                        </li>
                                        <li><a href="./node/{$node->id}">Uptime: <span
                                                        class="pull-right badge bg-green">{if (($node->id==5)||($node->id==6))}{'0'}{else}{$node->getNodeUptime()}{/if}</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </div>
                    </div><!-- /.widget-user -->
                </div><!-- /.col -->
            </div>
            <!-- /.row -->


        {/foreach}
    </section>
    <!-- /.content -->
</div><!-- /.content-wrapper -->


{include file='user/footer.tpl'}
