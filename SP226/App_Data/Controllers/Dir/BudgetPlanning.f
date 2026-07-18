<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY Check "if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
select @message as message
return">
  <!ENTITY k0 "nam = $nam.OldValue and ma_dvcs = $ma_dvcs.OldValue and ma_bp = $ma_bp.OldValue and ma_vv = $ma_vv.OldValue and ma_ct = $ma_ct.OldValue and lan = $lan.OldValue">
  <!ENTITY k1 "@nam = $nam.OldValue and @ma_dvcs = $ma_dvcs.OldValue and @ma_bp = $ma_bp.OldValue and @ma_vv = $ma_vv.OldValue and @ma_ct = $ma_ct.OldValue and @lan = $lan.OldValue">
  <!ENTITY k2 "nam = @nam and ma_dvcs = @ma_dvcs and ma_bp = @ma_bp and ma_vv = @ma_vv and ma_ct = @ma_ct and lan = @lan">
]>

<dir table="glns" code="nam, ma_dvcs, ma_bp, ma_vv, ma_ct, lan" order="nam, ma_dvcs, ma_bp, ma_vv, ma_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="dự toán ngân sách" e="Budget Planning"></title>
  <fields>
    <field name="nam" type="Decimal" isPrimaryKey="true" hidden="true" readOnly="true">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true" clientDefault="Default" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" row="1" key="status = '1'" check="1 = 1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" isPrimaryKey="true" dataFormatString="@upperCaseFormat" onDemand="true">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$dmbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" onDemand="true">
      <header v="Vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1" information="ma_vv$dmvv.ten_vv%l"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_ct" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" clientDefault="Default">
      <header v="Mã chỉ tiêu" e="Article Code"></header>
      <items style="AutoComplete" controller="BudgetArticle" reference="ten_ct%l" key="status = '1'" check="1 = 1" information="ma_ct$dmctns.ten_ct%l"/>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true" defaultValue="''" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="lan" type="Decimal" dataFormatString="#0" isPrimaryKey="true">
      <header v="Lần chỉnh sửa" e="Revision"></header>
      <items style="Numeric"></items>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat">
      <header v="Kế hoạch năm" e="Annual Planning"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat">
      <header v="" e=""></header>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Ngoại tệ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;FC&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt01" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 01" e="Period 01"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien01" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="" e=""></header>
      <footer v="&lt;div id=&quot;baseCurrencyID&quot; class=&quot;LabelDescription&quot;&gt;Hạch toán&lt;/div&gt;" e="&lt;div id=&quot;baseCurrencyID&quot; class=&quot;LabelDescription&quot;&gt;BC&lt;/div&gt;"></footer>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt02" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 02" e="Period 02"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien02" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt03" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 03" e="Period 03"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien03" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="1">
      <header v="Kỳ 03" e="Period 03"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt04" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Kỳ 04" e="Period 04"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien04" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt05" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Kỳ 05" e="Period 05"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien05" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt06" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Kỳ 06" e="Period 06"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien06" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="2">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt07" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Kỳ 07" e="Period 07"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien07" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt08" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Kỳ 08" e="Period 08"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien08" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt09" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Kỳ 09" e="Period 09"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien09" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="3">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt10" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Kỳ 10" e="Period 10"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien10" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt11" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Kỳ 11" e="Period 11"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien11" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt12" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Kỳ 12" e="Period 12"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien12" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="4">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" disabled="true" categoryIndex="-1">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" disabled="true" categoryIndex="-1">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="stt" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="88">
      <item value="120, 30, 70, 100, 100, 130, 0"/>
      <item value="1101001: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [stt]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11----: [lan].Label, [lan]"/>
      <item value="100000: [ma_ct].Description"/>
      <item value="-101-1: [tien].Description, [tien01].Description, [nam]"/>
      <item value="1101--: [tien_nt].Label, [tien_nt], [tien]"/>
      <item value="1101--: [tien_nt01].Label, [tien_nt01], [tien01]"/>
      <item value="1101--: [tien_nt02].Label, [tien_nt02], [tien02]"/>
      <item value="1101--: [tien_nt03].Label, [tien_nt03], [tien03]"/>
      <item value="1101--: [tien_nt04].Label, [tien_nt04], [tien04]"/>
      <item value="1101--: [tien_nt05].Label, [tien_nt05], [tien05]"/>
      <item value="1101--: [tien_nt06].Label, [tien_nt06], [tien06]"/>
      <item value="1101--: [tien_nt07].Label, [tien_nt07], [tien07]"/>
      <item value="1101--: [tien_nt08].Label, [tien_nt08], [tien08]"/>
      <item value="1101--: [tien_nt09].Label, [tien_nt09], [tien09]"/>
      <item value="1101--: [tien_nt10].Label, [tien_nt10], [tien10]"/>
      <item value="1101--: [tien_nt11].Label, [tien_nt11], [tien11]"/>
      <item value="1101--: [tien_nt12].Label, [tien_nt12], [tien12]"/>
      <item value="1101--: [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130">
          <header v="Quý 1" e="Quarter 1"/>
        </category>
        <category index="2" columns="120, 30, 70, 100, 100, 130">
          <header v="Quý 2" e="Quarter 2"/>
        </category>
        <category index="3" columns="120, 30, 70, 100, 100, 130">
          <header v="Quý 3" e="Quarter 3"/>
        </category>
        <category index="4" columns="120, 30, 70, 100, 100, 130">
          <header v="Quý 4" e="Quarter 4"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6c3Y3QB1EUG3FVuqjro7zqfOfZ2Gk21xZiUz33bsMZw0gr4df6zqyXF+11zKKbx8JvVgGlyzBM3MlPWSky2ehL0dtxmLZpwfthx8RrdnHzxl6Twayas3suTFbEIYbEL1yoIp5vef4XPmiwBPmqnYcd7/Gb9Cxs7NwtY15DLIjExPEugcttvMYn37V+MFwAWHnJHy0CrtJvonyy9fWQcZ6UI=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427RdouJMDIHaLGEc1W5MKjHm92BRawgQwE51HZzTkYo+/T1oj5142sFP2Fk5wghSsPRYujy1N8lfm06YVAtKcrUJ+CAFivUBQNE5mJFWuP1isOsNovAj76wRe7QFEH7E/5cCq2EMZc5uHkwRuEbWiRSmVnztvz9YUuYWzK81WFInE1bIv8xkO8JqniryJSSNr4NG/pIQeos6tFiofS4BABWFrC+C5eO+xnWNvEd694vQL1vZAxjHWrZXtcqFYx4vSHOC+WdKtaqjQnbZtBuqDKC75/KQ==</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOKmqQ5J3SQ+XhwHfy1ImQqRBaEjwbyy6u/5+aG5gi5f7ZuVQHCfzgBT6jSFK1oOsS</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf17SB624yUQlLPN9Ubj+9HxP0fz4MjycPzxMWD43kFv1iXLAaQom9yfKaiLJNYQT2ffWnLPBn6soodgzhQ7SNeU=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZuliDHM40QpvMHWFEm7nU9iXtesZXAz6MAQCjX6SYIaIkw3AGFNYWapOaeVczwBdVmHS42OHeANfH/Jghi+n72jEpAByB461Sv70swc+5mMAspmh74BTkusi6NQOGfcB963+CamSbCROY6Lxbf57ZsRDPLpL83SrwdigCB9CGAtw94rG6dYt8Q6v0XtTPOYvvD1HznpGmhPvBYF9zcreS1K2QkZiSCx+W93Wv5/+jPL+dBQ5oAm/ufPlfaVSSEldim1TOcTVOpBtIlDfWtyzoLG/TZpeYhmkeCJ8CdxfaGcKuL1CdpYO0Nuqoe3pqBbpREL6SAHdia67SFOAAPb2DeygodSisjR6GzlxewPnKdNssf0rrOMLCt1ampZ92KQklSZZoBMVHzQW3yLWbAM1uAcjLw==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmil7Uk79hqzsmWe65iO/nwA3geof80VtZMBj/xa4cYr9y8MJgCAuKYTKiPwG6bDLdOCKd3LdoqWktDd4WibiH89VTJ72PsTb3qFqTIeRQJnHr1Bb0CNBqw6xpYFTl2t7u/muVjgo352kFclw5hod3AN</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k0;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmil7Uk79hqzsmWe65iO/nwAqcitq5IT81uSUmvTq9xfdGxMX0BJM3ORtuDExw09tFbSzr+wGxUwuAZM/w9aiPkWojskGKvYBke6NRHHTej9Gg==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKoQJtNHhH+8h/W1kPNhTsIDaxsroQvhd+V2peMo7tSG+M=</encrypted>]]>&k0;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYYjEvtx/DFlhOX28kEpDPoc=</encrypted>]]>&k2;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYdX2bkvtVpvqS7eHmmxs9WL4iM0SkFAAJgUrh7CJ3HztwAACUrbU2d85YTPuaEJZD2nokdi01sCsNA+1OgtGh6n8HcwqpbtEBVWpaGxkncki</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k2;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEXCUz+bJYH1FkO0fVOHix7K9Sm4a74m9LCX+5ptz2gEDE=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSpO6gwfoN+5wMICOxjisrvdFwesuf+7/n8fG16w3R0x8WkgfLTfalciVnxYVT0fdOPuTAlxsWe2M2szW/cro2ZR8wpnEeXHm1rTtkM0nAARJQjdU0os3f4O/bLb9voSviN0KtkTlg/EpST6QiQLD+MMrXYEPjvU24DsB2DcKYl4j0bZk1ozBBssBK3qaTo0VUjpo/yZhyI8Nsb+8PVhGdxkuwmz5adPcAw1jbKHCnDOOBEehwBeuB1/pGVTdZPZn5NEFLsNr0fhokVmPrc9Sp2t9AduAP5rSKCE5popjHetYgs68+xE+ZpOxhryu9cy6tFwgTb6Ms+OwXZVjSekf40/O/kdKc3nwsoA8uMFQQaqVX8g2uYa/4pmLFX4Eha+5+05cg9ZrFgbgE24DAWhUGxuQCLq5v9D76SREW0oLGEbJBmbkfh0YBYFA7SygDLQW7VmwHfmAMwFEP7bwL3TmrmgJYQ3JyEhxVvSz7UqXIES7ZD/uNkMOAHQKLy9Gi6ulfD7RefEyh6ASYWPN1SSYxjNcNxW2DNi2I62yg7kXLnNCRdnhwQSp9MkCg5h9yuCVEN+yXlRlTQR5CU7m9WHwfM0hii56iaD6vswQCpkCHBY27JnQR+/bGjjt+43o7V+Q4sxy5Pf2/f2R2ltBliazEyOV5mrleKzJqgqpQ8yfYFrdtB6x6I94Rr6x0828Kf9UJTLPFfloItN2wCnn91KJXLU91tIi8jlDzc/pefnflEHjDnAY0xALAjVZQ0vAyoUFIB0eZKr0BHvnLPBAY6j1kRz8qmjDjjhNFJVVTy2hU7MlmbBSsTmwOH7AnGGthUGLMq3fZjDmfBfiGVTASxEKrypxEO3yOXDS2SzDToF/6BRqaGH0fqnJTbiBTCx+/c8yEMRTy7HETeJyHTVpEQdM4uMJ+lVJHU4NppUd0fi2XBuesn/z+oyjMphitVpHFH/ILC4BD9B33auL0ZlHBA7NDDtl3eIAZPEeatipiCm3BYWJjZ4HGP6/I/tbESZEp1XcVd3uiyTWAjaDvN5KLMEewyQ0QeoJh8WklYAqfasM/EnvVGVJd6LIggWgYtfBqQOeXq8i6ZDPW+gbl7KfaKmc4Ug</encrypted>]]>
    </text>
  </script>
  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIaK/cC5r/EwiY1w5VaLvIwj2XYXDp2CaxJ/nr5QH5gw+zeaWNmfx/5sFmJkUQM0M4DiaPDe/1/zMFf3zJ77xb/Jn8J7ZYIF0IkVok5a+62w2cKnQV9/wYPOcE2JTmM31xA==</encrypted>]]>
    </text>
  </css>
</dir>