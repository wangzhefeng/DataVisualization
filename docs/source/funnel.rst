
漏斗模型及其可视化
====================


1. 漏斗模型
-------------------

- 漏斗模型的本质: **分解和量化**.

- 常用漏斗模型

    - 营销漏斗模型：
        
        - 营销漏斗模型指的是在营销过程中,将非潜在客户逐步变为客户的转化量化模型.
          营销漏斗模型的价值在于量化了营销过程的各个环节的效率,帮助找到薄弱环节.

        - 营销的环节指的是从获取用户到最终转化成购买这整个流程中的一个个子环节,
          相邻环节的转化率则就是指用数据指标来量化每一个步骤的表现.
          所以整个漏斗模型就是先将整个购买流程拆分成一个个步骤,
          然后用转化率来衡量每一个步骤的表现,最后通过异常的数据指标找出有问题的环节,
          从而解决问题,优化该步骤,最终达到提升整体购买转化率的目的,
          整体漏斗模型的核心思想其实可以归为分解和量化.

    - OKR (Objectives and Key Results)

        - OKR首先是设定一个“目标”(Objective),即大 O,然后将该目标拆分为若干个子目标,
          即小 O,最后将小 O 设定为若干个可以量化的“关键结果”(Key Results),
          用来帮助自己实现目标,即 KRS.通过达成量化的 KRS 来实现小 O,最终达成大 O,
          可以看到整个过程中的核心关键也在于分解和量化.

    - 电商购物流程

        - 待更新

    - AARRR 模型
        
        - AARRR 模型是指 Acquisition、Activation、Retention、Revenue、Referral,
          即 **用户获取**、**用户激活**、**用户留存**、**用户收益** 以及 **用户传播**.
          这是产品运营中比较常见的一个模型,结合产品本身的特点以及产品的生命周期位置,
          来关注不同的数据指标,最终制定不同的运营策略.

.. note:: 

    漏斗模型不仅仅是一个模型,更是一种方法论,一种思维方式的原因.
    可以通过这种分解和量化的形式,将问题进行不断的拆解,
    最后通过量化的形式来辅助达成目标,或者针对异常的步骤进行调优,
    最终达到总目标.它可以广泛应用于 **流量监控**、**产品目标转化** 
    等日常数据运营工作中,称之为转化漏斗;也可以用于产品、服务销售,
    称之为销售漏斗.







2. 漏斗模型可视化
-------------------

数据格式
~~~~~~~~~~

.. csv-table:: 
    :header: "所处环节", "当前人数", "环节转化率", "整体转化率"
    :widths: 25, 25, 25, 25 
    
    "选购商品", 1000, "100%", "100.0%"
    "添加购物车", 600, "40.0%", "60.0%"
    "购物车结算", 450, "25.0%", "45.0%"
    "核对订单信息", 225, "50.0%", "22.5%"
    "提交订单", 90, "60.0%", "9.00%"
    "选择支付方式", 36, "60.0%", "3.60%"
    "完成支付", 29, "20.0%", "2.90%"


