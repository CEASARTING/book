<#--java左边菜单-->
<#if "${topmenue}" == "java">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/java/javabase" <#if "${leftmenue}" == "javabase">class="active" </#if>>Java基础</a></div>
    <div class="menu2"><a href="/211/book/java/frame" <#if "${leftmenue}" == "frame">class="active" </#if>>框架</a></div>

</div>
</#if>

<#--c++左边菜单-->
<#if "${topmenue}" == "c++">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/cpp/cppbase" <#if "${leftmenue}" == "cppbase">class="active" </#if>>c++基础</a></div>

</div>
</#if>


<#--前端左边菜单-->
<#if "${topmenue}" == "frontEnd">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/frontEnd/frontEnd" <#if "${leftmenue}" == "frontEnd">class="active" </#if>>前端</a></div>
</div>

</#if>


<#--数据结构左边菜单-->
<#if "${topmenue}" == "dataStructure">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/ds/dataStructure" <#if "${leftmenue}" == "dataStructure">class="active" </#if>>数据结构与算法</a></div>

</div>
</#if>


<#--数据库-->
<#if "${topmenue}" == "database">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/database/mysql" <#if "${leftmenue}" == "mysql">class="active" </#if>>MySQL</a></div>
    <div class="menu2"><a href="/211/book/database/redis" <#if "${leftmenue}" == "redis">class="active" </#if>>Redis</a></div>
</div>
</#if>



<#--计算机网络-->
<#if "${topmenue}" == "network">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/network/network" <#if "${leftmenue}" == "network">class="active" </#if>>计算机网络</a></div>
</div>
</#if>


<#--python-->
<#if "${topmenue}" == "python">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/python/python" <#if "${leftmenue}" == "python">class="active" </#if>>python</a></div>
</div>
</#if>


<#--操作系统-->
<#if "${topmenue}" == "os">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/os/os" <#if "${leftmenue}" == "os">class="active" </#if>>操作系统</a></div>
</div>
</#if>


<#--机器学习与大数据-->
<#if "${topmenue}" == "ml">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/ml/ml" <#if "${leftmenue}" == "ml">class="active" </#if>>机器学习与大数据</a></div>
</div>
</#if>


<#--其他-->
<#if "${topmenue}" == "else">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/else/else" <#if "${leftmenue}" == "else">class="active" </#if>>其他</a></div>
</div>
</#if>


<#--小记-->
<#if "${topmenue}" == "essay">
<div id="leftmenu">
    <div class="menu2"><a href="/211/book/essay/essay" <#if "${leftmenue}" == "essay">class="active" </#if>>小记</a></div>
</div>
</#if>


