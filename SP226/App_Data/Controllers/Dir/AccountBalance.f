<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY % AccountBalance SYSTEM "..\Include\AccountBalance.ent">
  %AccountBalance;

  <!ENTITY CommandWhenBalanceBeforeEdit SYSTEM "..\Include\Command\WhenBalanceBeforeEdit.txt">
]>

<dir table="cdtk" code="nam, ma_dvcs, tk" order="nam, ma_dvcs, tk" xmlns="urn:schemas-fast-com:data-dir">
  <title v="số dư đầu kỳ các tài khoản" e="Account Opening Balance"></title>
  <fields>
    <field name="nam" isPrimaryKey="true" type="Decimal" width="80" readOnly="true" hidden="true" allowNulls="false" dataFormatString="####">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="tk" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false" disabled="&Bool;">
      <header v="Tài khoản" e="Account"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="&AccountBalanceKey;" check="&AccountBalanceCheck;" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="du_no00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ" e="Debit"></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu kỳ&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Opening Balance&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpwkebGVMt4XyuksMVZ/gRzS2ACtIv6Ri2rY5aPln7IEs=</encrypted>]]></clientScript>
    </field>
    <field name="du_co00" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Dư có" e="Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxp99prrdjZgBigRms+SKGOSM6baG41P9iS7Iqss5BtbD4=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư nợ ngoại tệ" e="FC Debit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpHddPizvW4+dDBV9DzG0ey9184V+4OI/I4b8eL3VhoesSntIr22M7YWVx92jOZkYt</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt00" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Dư có ngoại tệ" e="FC Credit"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpTf9nTApFhrPAjRLfnRhCn2QOWzDxsEMMPuF5ZreJAzWXnhUSp+fGusKq3sNIFBqA</encrypted>]]></clientScript>
    </field>

    <field name="du_no1" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <footer v="&lt;div class=&quot;LabelDescription&quot;&gt;Đầu năm&lt;/div&gt;" e="&lt;div class=&quot;LabelDescription&quot;&gt;Year-opening&lt;/div&gt;"></footer>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpIX15gj4Vp2WTGcG7SxWiDljy/mAzYQUXQ0541OrohxA=</encrypted>]]></clientScript>
    </field>
    <field name="du_co1" type ="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpNI88pAFnGE1gE/AKIbTHkBykHYvXygb/sPsFP1UW59w=</encrypted>]]></clientScript>
    </field>
    <field name="du_no_nt1" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxpLnqX3wyfbnjRxr/vjY+bfglGNBGQv2JMQimrmjNQwo0=</encrypted>]]></clientScript>
    </field>
    <field name="du_co_nt1" type ="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVusbrk895uGZpSWBoEV1NmS+n98QMAqMoyOkifvhQxp6pY2rIwnLeY0XKErsMQUri5/cGNen8Bnvka4fYBxVUU=</encrypted>]]></clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="8, 112, 100, 100, 10, 120, 100"/>
      <item value="1011000: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1011000: [tk].Label, [tk],[ten_tk%l]"/>
      <item value="1000000: [tk].Description"/>
      <item value="--11: [du_no00].Description, [du_no1].Description"/>
      <item value="-1111: [du_no00].Label, [du_no00], [du_no1], [nam]"/>
      <item value="-111: [du_co00].Label, [du_co00], [du_co1]"/>
      <item value="-111: [du_no_nt00].Label, [du_no_nt00], [du_no_nt1]"/>
      <item value="-111: [du_co_nt00].Label, [du_co_nt00], [du_co_nt1]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHaRRFLTky5BEvd+E+QOge2OPcWtFtMoTtN3aaJnhGszRMYCjLMEd2Olr4TzC8qMpzAE8mLLMpvIxgN/TPjYUK6RmNYFJhInvKg1Svf8nzdedslAi0tilboyiG9bNlWWrp53j4BAQUOWZD7d14OMysBWp401c6kSP8ayZgvH1sfhI0EveD9TrtK+1d2N4CbRL3js1CBsun3dKy1Q1FDh/bc/SXD0RZK8Lq5SDasAeb1Tlcw6fQEh6Ny7hGG/pRuGbvqKFMRk1iH8KvQwvL1lLkQh1nqiHcrgWLcFOajH6wLQExFZmJtE0hqNJ8Qu5tx07alOyD1PnrK0rfdeMooy2Bhm9MWQXpJxqeCbGx3pd/KRZWbqlZCDAziDhhKWBatRtRFX/zgPgCp+XaKov/AmMc2iWBz/Xw5eXFPsAUlTqm300w==</encrypted>]]>&AccountBalanceInit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOmf7U01vaOUFYyufwSdHK2W6CCn75vubM3YY/KtPc0qx33OMOlRSbwHdReWkoGS+4</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        &AccountBalanceQuery;
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cz5qm65kDSH6N/uTFzPCmYfry5vGMQ2gPxpYl0UfBPEBnyT6yhbeZyT17/YHQsNakIBSyIbjaf5leTNT2wLn9zGGNjIu+102H8gZOgASMg8/L/O4bsvvmGr7HGLTvLiOhxAX7hqD7JGTb44flqkTnGXy3xb9PeP2CnWYJusCYLQObzPnhgqRbZdKaytoUWLgFJwjg4VHZe7D92xaFRSRO0W4GXCpcyZxjUL/uuT0xNrFYrZGC3OqNGQQSXcWOJ8b3nsE2OrlEFPUr3GIe7f+70r0tTJD55GLifibFh7HAy4sDnMplqdclnvl9MtOXtvGedzozNKV57zjDjKZsKOV79SGNVMuW0bmolvh7Ul5+G2flCnPXQ2nC/nFx1yVaqToy1FXHJljqj/H8edpfyEma5Ys2TsQnemP5KuZIvZHUoYGMKzsID9TQ2LDxweZ+v8NqMYuJJyuZHYYx1S8Rqb90EgDe6Og5jiWdQZzFURP5F74=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbev+SPD20ydJUl3KFBhnojPCz3nWj+QCqdcRYwO+Ll5w5bdVxeXL269CT1zNJrqmJ2A==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBalanceBeforeDelete;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK43w8bvP8sKjZW8EVaoBYg9qSDVDmd1mCzB5q0ia+7I6AzEIOJj+XnsKD0sBkVA7Q9vAEs6EtGSzPOSpRtqi2gsL+WmDb2jQFpc7H0HfZZDreKfR4Ntnbf9nO6oOXdT0SEPM/41Vj7fP4IkiMYvSPMxwHf3UqqF1O2DMKp9bDoivsHaYX9hCpIc8oyGauqISHjHkmzPzM4/zpnG+Yd5qHJmPTNrwLgWdAFj4w8BbxPlU+EgjZ5f+MbpOFsh+nnl8WkOxVF6NH9MK0Sv9ShqkZ8AYMyl6aw7XnbQTg0MHzesq9JpLlMRCOcjor6p7Fcni/C6jBZGdA1YcoGYj9ozLuFTjOFgnZAlB30DNyU0qvSFUUBpSMuWxMS3+Fx6jqmuurw=</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOEIMKqqkSoK9gqDO/lshH0UNdZxvjw4I+evq5CnQEn3L/ERWOpQ+TZv7bdV0Ap8B6/dljZUf2EHUKti3cX+17j+sKX6v3CoN+7eXAZHTl09s5kJRg5GqWxxPx29jIHRVgvqneqTQ6Dm5L9pS8jGetcHR+VquHbNMuvWDj0JGgUKaOTbd4kSVTk3xCKfwcD7uC+v+T8MTaLOWYAafAIeWc=</encrypted>]]>&AccountBalanceScriptWhenEdit;<![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KtmPha1RPTo1evsZiFtvmV7JkhlSB4pCwAJp9ES6BawefVHxk2RrodueDtPmnI/nsBBcipua+XtJ+TpT9LIF6QeWDoowExxxbNJGQ8qFovO/V+7gNwgn0LnDcJOLD5C0OtEBXqnkZDfBUV6gK14AiSupePXLWuqOovSqpmSaB11BCWVQnT+AZeHO/7CgfRE8LSeIXqsFFqOKPISoRCo6nV0rcNpYYgQG/kx4mt7U7J6cS04RbP8CWl8hbLx7qDovpqYIfF/tOrGUJq0xE7i4ruY=</encrypted>]]>&AccountBalanceScriptWhenAddNew;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70GOXkPBseXGjNO3SbwYpKgAXn76/naQT1fwsBkHlKhnlCBFCk6zCM0RTLLDwZWo3UqNBHkjvbCKkF1e0DX+WROifNiYWfA0hQXkmdNw6PoUswV+YPLu/zPTTyDOBqiDP9gaYOCxdg3dwbhrvPgtB2x6BKMf1g+ywWswkTOkqWzz9b7ZMdw2dodK5NOrg35HmJVzmwqgLNtBdnroa/Mpkb3ulk6rzhyJh5llDc4jw52hdgogsAs0zfeAYSdN/RQj+MwipJuiBj/VCw8tUuGgsq78=</encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5uy1Z6N60E5aB6/vlhUbneiIqSIPkUa76CQUQkeLAQdisFq/w0AZv7Ufm1E517NsC</encrypted>]]>
    </text>
  </css>
</dir>