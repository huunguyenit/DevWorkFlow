<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY ExternalInitVoucherNumber SYSTEM "..\Include\Command\ExternalInitVoucherNumber.txt">

  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY DeleteCurrentStock SYSTEM "..\Include\Command\DeleteCurrentStock.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY CheckQuantityBeginTag "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+5+cmorz+FfTDm8vy8udRdXf3eD4NvyTq1CZuJKMTOqtTqMPI9IwiYOFmCsQyjEF9OMp6JkPLv+io5BYe/Ne/DbbOqgO0TZp58EdiaUVZF3wKsc41MzOYGjFFz+9+mML0kmJhEZ86BWFPZOPSMDTUTGasOoS9u56CKxmmBUOdKThSLQeBwKRwkbLXNXtiDyoKj0nNv0EgITlohBxml2XPjFdTTKOVK0r2W2ZtxswMplyU3HOGPlusdhSyvEDj+LvHBaWeq1S6iNM7ImXZmZlPsdB3ohdaBhikcz/vLdJi4qe/SvHnLYOaZw7iLF2JhJ6BZEYv9DwSc6Xg+MES5AmT3qPIjxKx0GmeaR63G3eFgNo/fWFMIn3VdnWNy79GGLNULptE3qxAqJPKym1wPvdUnq9H1E+RMcl9AsV8A/OzerncMmw13fPEsVvEFS+WbiZoCOKSsZ8xnWRTlt+dW+TrPxt6XJY5dugJ7zpSFdJUo1ThbMkTd6FwbsCX2Ol4n6KjO2HoM/Zu0LBoyditxu64cp5vP966D2qaMrLCJ7xN/C4Wuo0l+K+lL3qgocNJfGAvwjjBQPrlQhMv+Jmsq4f6v0=FastBusiness.Encryption.End">
  <!ENTITY CheckQuantityWhenUpdateTag "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WjePkifP8kgGJcllqVuhqhzVNMVEtxI556sfv+2mnEc9mYpUqCoiMp+GZNsLqfvnteRsFRQUdcWw+IC7GwW7bEEl4b2I1TVLHvjmVHOmBgRZ+XSirrel3XZuawCsZSAUGUm0GH1XSBeYNR0JN1BOCmOESYCnTdtRFlCPj5wbfYQQyLBf3ORopRZue4IX+jPE8UlmJQs5RKrxwHZWDxBst/xqJFRPIcWIJmsNKatD7z3KcRADi0fsRnXKx4wRr263uBxANhhAeOj68y+rErs9Z4qkyH3pQ04DxWxla6gur/HMETgugg/S7UVBxWQd1h6i6oWRhmXj0Yws3/I1ZBbaLlXQSYHB7WYBomuyOa4vTWO62sqJ9CsyZZdDzMuXR8x8iz5edt1VlzO/du6p9oIbP7VMTg9DtYCDmIrA9KxA1ZEFastBusiness.Encryption.End">
  <!ENTITY CheckQuantityEndTag "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4SMQ1Cy2YJU0zQB0EgP6rc8BQBV4pbZc7cgzETNKvPceKmynt9Qvwz9L0a5i/7SWiMbdgFz0DIeFBDxtu88xH7L8OxqWeoYeD5XyXE8UhNviJf6BvAbTxCdje8vdys43RP7shV5f4buMlc3YvkJ1Je8J7X+2Kvh84cUzANHgMuXsee+jNMg1U+GJP6nopJzSlqIRNmh9H82PWyp2LXhJuZb2lPnGF2EEWytlIYtrh8szMgEeg7hm5R88ALJLm/MpgM4xNAZWvsCyYW9FKNuOeyl6TxtlMM9YQepOnwRgoPx27pI9irK8ivNlvG21NbPkE7rLYHfPGkYeYqMKqS2vbd/qKmjSCXv4LmYpEdUW0jST4P8YvU8kbFBOmrsMPfscaXOmO68QECz+ZcVXT2OBBfuPCH5yOUPBHkvOXWJRaZrcwkU6efhBQHaNc+YORv3bKVewcDLoASsg5g3Fuxq/ef8ToS7pu+HFT4ec3nK4YISdFastBusiness.Encryption.End">
  

  <!ENTITY CheckQuantityBeforeInsert "
    &CheckQuantityBeginTag;
    &CheckQuantityEndTag;
">
  <!ENTITY CheckQuantityBeforeUpdate "
    &CheckQuantityBeginTag;
    &CheckQuantityWhenUpdateTag;
    &CheckQuantityEndTag;
">

  
  <!ENTITY UpdateCustomerIdentity "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu47+g3FRwfziXR+DIyFYcD4kESrENi/z8SKp9iLj99wW4pPBrGSuztO1GXUh3FWoDzUR11hbitA6PT8w3rk/jOvbTh4eBUd1aqgOH43j+oW9XSVOD8C8OGMkIVI7G+DOBRp9ypXwgYTpSupHCCp40TcF4/AtqnyfcVEroF20a1S1hs58yq7vLNNymvOfldZPiCOhXS78VyN4cyaNhZ8y88bwgfhDxG0vcW052ldgATGcFastBusiness.Encryption.End">

  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/TLESNJgDwdVWZYqD1+9cYHthZIXzOiXricD8nkPuSacR5yj/p8L1ioMTmqND6K68H5XyeZBcnpyQamTJBuiv0GwCroijgk/fXcm2LS2cqIJE=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5djxvne5zo2TxoJ+NzANIJP8gTaixeWaT3VUJK7cLIfuy3oe0r2rNyLv6+MC1ITBlgfKbMaa8abikhszwVp0P+vAW+7+CC1f5w1OLWZHC2Qow=FastBusiness.Encryption.End">
  

  <!ENTITY DetailVariable "@d97">
  <!ENTITY DetailTable "d97$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = '0' then 0 else 1 end">
  
  <!ENTITY UpdateCurrentStock "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+6OQAuE1QjEQkb2GneySWEjXkqySTja2LYFtiKjMVNyti6Tp9gX3GlsaCxUWsZqMUCFd7+Gk88W6PMrT22lIOuhg+Yt4K7atE6bmpBmvg49gQ0BXN9ckjXw2dVLUGEUH/35YYWhBPmcEE/zeAUxC0mHiWO0XUlvrtMsVX+voWOKr8XVhdwHBbS/h+L/9N8JTOEJOxYXfRp+09J2p6CGoAJ/thhtpVi5/8DJC4rFpshJ+FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kp6PS2M0MCb4KXeW/K2Bh2zuXzTyjsuXkjZ4506i6V+e3kIMX6ySTXnorDbn/DbzYrLOZ+YWGMsgkmeMRUIIMmIcsAe158/ZHSuEMA847wq6o=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHjMEEaPXaTcsXDAn0WDWd3Wcoz+VPtGlmKRabMg4L9qDbVFWKLaHR8+fPWCYLzhlXmzs3Tr5TKvOVx3+yalSmOPuSXLF3mdY7xFJMcJ595tUFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHrb4ioB+kO4gS3eCZluuVsfNVA4ZSUxWrKrSr3g3Vdn0oGQ+KmjA5V5LZ0NS2uE355ftucvlHTHgOtRjbO5X7ZkhxRSElGl76zPbBMGP8sRcFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNOI/9tCtcjikHSeCioIzPe+dXtoBt95nH8e2O28lqtjfLAJHP/2f6FB3mrdP4M7Pljd6CukyCfV2VFHDGBN+x2S6POZUkfN4SnDnYG5hVbYIG8a5EjkFqK3rwbO1TMSCAY+nNuWzhFzhlk+SRoHmtxfd1yzSjZYDQwffDHe9MJFdywP2DbNYprlLJlaWs8oUSfR1N3ZsQYKZe0ThsxYCdOVNdE3/QdS4qLHxYvWT86PaFEFKpQbis+34GQiNaBmqSgBc+LdQhDUHCJWzzysJPM0=FastBusiness.Encryption.End">
  <!ENTITY ReviseCurrentStock "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+ySSDljcOZ8+T0vEA92Mduok2YkySKq4twFy3yeE/9yXZIgQ3ZOB9wjbh5Q2jygh79Xm22g0xyr7V60Pv/Y+x/WcaZgkOZ3tp0CuIfROb6YTUmw7HB7D+BoL6o27c95GxoFsss8/vorVIcxvlLek9Ay+V+O+jA+f6SyaohWNGcMeydhQQJNdf9bUdcj4JlGg3bidFaprAhB7jF1IgYraVe6i9LOqBuIt4CPulRdkEFjiFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcBXgjGWS9VRA64jX89rO1Kct5RY/C7SRPV5B3MtI25kp6PS2M0MCb4KXeW/K2Bh2zqapu62ovRnFC1f3wGwu6LygXW8ofvSqDxotSCoowyDeCtz9cvVz57jt5LrafhpGKXGAl1Jl80m5RP1tgicA1co=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHjMEEaPXaTcsXDAn0WDWd3Wcoz+VPtGlmKRabMg4L9qDdYlL41WZHNgcOy4OeUzrNa3S0P7pwHjn3TvgYDxHmlZPB4BjJAA/CnWPUhhUgEdbFastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHrb4ioB+kO4gS3eCZluuVsfNVA4ZSUxWrKrSr3g3Vdn0ODQO7Pk4bLaMpEyKCE/NO6vEgLmMLkK2GQiCu8iKaM67PdOYkV3+++QW6Tc6QP0qFastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNJt+kS2PPC1NX/DYw1NYFnG2uo1UxRyvLAQ+Ozm8obGQFwpchS1MKsPFinMO3BgE2J6qMw3nYlS/yHLcWliKCsQOYS+UZFj2TLPxyXG99aM8BEpxFAnI4AKrf4PqP9XyAPSSWtFoFRSfx0vROxfjtq7JMZ6fUnv/6gkCoeV2F3DOtZLIRAkLauRArcR7s+xkDYuG28PD8FOknZ3OY3tZhO5SsTrumsMs0NGUuz+5r2y1eX3yOtqIZ2CynYMxhr4IjqILD/JpYN8APRSKMs6ZRRI2Bj6PeUmzigujvyHxzty1FastBusiness.Encryption.End">

  <!ENTITY TagUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcCCvUeh8oRF4cKdXZqR1sVhVUR8k5TL/YffuY+T96ckm25UX3UbLWqg4aadt+gGhgsHXi/ee5Hhwz1bu9Db5B9GMRuwZNqNVRVDAliuzvtCQAszNgnJQd7HzmdFj+yo36jajHYIFFcw+7B435tEUtirQfZU1qQ+9TOTD1oZbztqhEANfx7GmLRCWqJsjlU7q2g==FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCrR6LiW3WBB5+CryFZG6NJLivjT0j82LFgSHa8RUEx339KUc/7IycD9Xgc2m/ZYNGh6496E+B9WAxDdLwNA+Jlc8AeJoA3lJeSFYvfspH5hg=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu83ZYkZ3oNJVlv9bAUKotx5t5d3TixmdxE1znM0ttqcRNr5xB2XK7SojNimtjfuF4PAvJL5BfD9cTf61prW6h4N4Y7wFihcMmnJD3hQLbN1gDQ2Pwa6TDww5NZYf3MNmV+grVI3wGJlWrLgQTFOrcjNOPXxwkL7X4zmfv4HiyUNjat4FV7QwVV4zkj0tL7OYeQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8kpWVNXAromhqcmFA7nAWTThydiF920Xnm0pwhTMqjEHT3VNP4L4pibuTD98211NQxRFhkU/+fJJKLfY2ymfolcTPUMu445CQtxkLPQJLNBrOQPu49AM5G0I8P81NeDSmpi9URfAILN2Q2Jxy/gBD9nMfCv5RdUleH6/8iGMJBRSqe4bJ+zN2eLE72JBnUjedDWxgGEPEv2xE1BO0msEcgJhIPlsgw8qDpw5bZnLvv3eQydiBU03xprb1SKeOabY1xj24SJwxOlInefiJsgM1WmdRxqsPtMF99sff/K4nX6j+bNfKUOWNaCeoQ7mnexC3cA98/PmBzxOZFRvLJsQ2wunynYDJ+QbnyDDA7Akhh4vFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifrqY9taNnV2l6I1YCu+I0eCbjHgDFsIFQV+gv43St2iZCsXv172ZQ83Jz1GOo2uVEFVq/Iujmv4rZR8GO+6Sn7PCTdCzYjdSI7oR0iONbo/TR4jyOIAWQJWaDDRtfGIL4LMDq987eWLiSEqwwE47TtB9oy3P1X0e2/IjZFPbnWVvcinOaiwvjml33EAqYkhVQQdEHzL3vuxWx3Z8ZvVkTrlk7olWI1sh0NupAPZD5G0JzaWAEtl064M6icXqBCgwJbhe/TcjyMa4BAziTnE7xoO25VW0tl2ZNROFMCIEgMqiaTHmKwjQdfu2yBCs25oQ7LDyfWZ01Mn6XRMsuX52sCx10/Quw1YG4ohas+jh7A4BhFySjJ3ZEThpZrXZcpQZ43JAQ2i6eEM1hMfNxXA3zU=FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4TrRBgp++BFuLAZiVrbzKD3lMSy7ymglimvPsJkH7SLSLQyYDEKD/Z1dCRZhutP0l0awmMOHhLN0B1x1J8fpP09yNq38i01tORoD+Vep5sfApNEwbu6SU5bYBCW57/vO/w==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu9JeQ6BpL+iOW0yvEmllXuPA+XOjPz+ocynfyNqqEE8d5o5E5Tx8zvqjjeEqrBcWTuUR3n2ZLULg0NLieWiG2d0=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELHjSzs1KK1z7WiL/MgvziS4i2b0tPGuvhl4rOMJrkGX7RedxQjzyGotAOLPh8g47hMemjVtFyWzlqDVn3A4eosJFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PTTran;
  %Extender.Ignore;
]>

<dir table="m97$000000" code="stt_rec" order="ngay_ct, so_ct" id="PD2" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu kiểm định chất lượng" e="QA Transaction"></title>
  <partition table="c97$000000" prime="m97$" inquiry="i97$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người kiểm tra" e="QC Staff"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_nt" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" hidden="true" width="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_gd" width="0" hidden="true" clientDefault="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="1">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu kiểm định" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_pn" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" disabled="true">
      <header v="Số phiếu nhập" e="Receipt Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_pn" type="DateTime" disabled="true" dataFormatString="@datetimeFormat" external="true" defaultValue="''" allowContain="true">
      <header v="Ngày phiếu nhập" e="Receipt Date"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Kiểm định" e="1. QC"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d97" external="true" clientDefault="0" defaultValue="0" rows="264" filterSource="Tidy" allowNulls="false" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PTDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="324" anchor="7" split="7">
      <item value="100, 100, 37, 100, 100, 100, 0, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="11------10-1-11: [ong_ba].Label, [ong_ba], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11--11--10-1-11: [so_pn].Label, [so_pn], [ngay_pn].Label, [ngay_pn], [ngay_lct].Label, [ngay_lct], [ngay_ct], [ma_gd]"/>
      <item value="1100000-1100111: [dien_giai].Label, [dien_giai], [status].Label, [status], [ma_nt], [loai_ct], [ty_gia]"/>

      <item value="1: [d97]"/>

      &ListView;
      &PostView;

      <item value="------101011: [t_so_luong].Label, [t_so_luong], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2D1ZHWgEXdruCz7j1OpgPTz+0SdA25jGlr4yzgsGVVi3LOn/lhl7ofswUQYnBR4nS7AJkMfw2M/+4K0jdmOcZD1ZOQWQmJb3YK2cViqDiUxBUICbHU0f6M0Hr5SJwvBLuTRnZjQrpl7fofHSvsmgJlgGWTjSw0E1tfndMmXTQ3CAxl0IRWz5qLwQ5DE2XbHnt7kBA/STEjYUMYzgBkl2kHn2nWDEKBVY8hxEOkxOGzdWLhlMPGicm/0Ddiye/B6iFwCismfdb1HVZ+P/x/gi34=</Encrypted>]]>
        &ExternalInitVoucherNumber;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ09+KuZRCsLMv6WpMUGbdxZv1tinRsOUO7P/R9PYgx5HvAXQcE11akW+wzeJns4YMkVw4htezK8FH7/VvO+pQwKw=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CheckQuantityBeforeInsert;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxvv6gHAiVlPuEVt0VOpPlIRDfo6Cb39xPGBCT9QjldRZy4dSzZb9SlcRjxQ4x9114FQAEzFRqtWbkKcVwP0idTVR62AATCDByd2ngFnw195mx2XXcjOV/7kBmoCvF1ThtG/Wo2sVJ8YsYLgkFGBUNiw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJjM1U3LBrXoWMHmZkVVnmN+4XYZ4CbtuG/Ipc4hqLJoKa7GGJZxCRgTNzcpHbOYy+lsahGIripU94hssS+GjzY=</Encrypted>]]>
        &UpdateCustomerIdentity;
        &TagUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        &UpdateCurrentStock;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        <![CDATA[<Encrypted>&ETLr4b7Rzr4OjFrpPLLTZ1jH/VhPbXs9jWebE03C3KSvXffQsqd4swvEa/RvH33SQ2EuS4wKdAChMJfulDL+VA==</Encrypted>]]>&CheckQuantityBeforeUpdate;<![CDATA[<Encrypted>&YeMNTHB29VJsL6IOY8GY3sXym11dbGSMo7QZWRFJv0o=</Encrypted>]]>
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku8taVeGEVc1xsfMQ6b0AQa74nnOdHNx5nZ7mvyTjsW5mujTvHR4uV6uKiVSOnltzThnp7G7cX4rjgVRM3n/TRGio4OFHjMWxdnfTSjp0WFlu9JPKHn33bl/6wqSF+q/UofQ6PJpfMpA7+RmYcMB2VXGUKKKMji6jk1CRbMZLrTQjpzuCgYmO0gV3emygLDxcoXzgH9LEa8FXim/g6bM0/qEj/rls8lQ4O43Mh9z5NkmSVR9Ri8BijP6jTO6Kw1+9ABcoRl+GVYB/JPpziv5WB58lVw6rYnZiP/qHCZS9E4AxV1OU9zvCeVAYCsP9dUb/sVP1fEvlOJXZThkbSKvWcN8=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SlzxeTweqtAGVr7ADcuDFHHOvJaVa4nP8p5INQsA8PjWIZebjMBP2SHLHy1/kIzc2Sw9KQ99AZPwxiMDjq4DcrR43hJuri+bjlHbXDb4wJRBOKYHG2xXxC7XG+DJL73+8EMLcoA8kAazObt0ObnlkcacDLkoaQ3Kite4NvHS4lGGAfkYSbMTHmS5Bm4XZcvB1rUUZ6dTfEjO8d/R+3LHkgSrtXiWcTyCj02NXwLpMIC4opWqgLi0qMzhSu2dFuytQ==</Encrypted>]]>
        &UpdateCustomerIdentity;
        &TagUpdate;
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyGpLDq+9/VoeP9qzqa+Rzwftuu/D/A77R3iEfogYFl8EJJzT/ieHmdMIUOtycMsrD6cVDtBaN/DuYj19i5oVYFf</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bj66wWvyM7CWl3sXdwt/E2Aqsd/d0CmOf/Uxg6NEEQk</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8xMD2Fqe4GV/bQL85oW/YAfQCn1oBGQ5jT+EaUKS0uhDFBEmeNwIO8ZYJNrbIcKqZY+51xNmTdSDOFFAWsUOiY=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &DeclareStock;
        &DeleteCurrentStock;
        &Delete;
        &VoucherLogUpdateStatus;
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaYHAaIoDMi9q0mZMNSGnlv+kNZECqRFFda8TNOnR46d+4jRLCypDj+EoLnOUqlFSg/rlhzyBohRtPYUY0PGNb9WSnomXQ4rnIrGv/i6uhYZ0yeB0MloyvORx9uKKbg8OU0hxQ88SbByKsS+5CiQ58fS2P5dGvY0ik2bj+xAwXD+BfO4V7z/xVyvuyfDfNNTCV4Av0Tjhshry7DcR5RrcaTdvelj9BCTWD2XJz89+CCP46k56fLZgSvXTayBitMcTwvKe44aXoEopYXQuSDmu0Wrw0WbDEpovmW/4L5jByYTAQ7znrRT4061Q60Q3b47Ya90Tsnw9TdBv9myT0rAuotI3pahDUUO+XNeLjXWNS+4KSOAMgbIYBGqi8ZdZVNJrqBII0kV4J+ba3FfQBfsNf/JJotO0nRcfOlVmlP/pRsLiTDNWjR4wDMR3nTJSzglG5+ihFyOWVdkrFc5dEESC3e7yTI1Jc1tJSVNPmGylKHl37jaSwq4lDHKmkJbKWNjPRqDh898bWkhREZbJnmldqnE3X/ndv8sagihuovyaFzUFaa5P3kSobmNMMKMTWPoulo9+E63JIFSvOdAb+E+vjlP2//AgKZ+iIawsFFA315ueEO3WlGDzfYGP/XnyT+Eosr</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3b9eoc+RYLbv1ek/B3ubB9KZB4ARTIDZ5YIZBtWoeeMAsp/qaZzumNqO9FPEjKFP6Hz22GVYCtfu+rVIdqJzDFmC3DNeNLdeA8bNES40LvJrW53eLbYWdKosTrW6xm20mQqqik3JNKARWxpWgL6PhIxxaz3x3OzsVA1ZqRwHlb4d6HVsaQ3KeuOGZydNvpQIylLHfBuejaJsrjnxz79hOAg5hBn2nnnRqQrCn6ypbxUBvU/Z7wDwjTYilptvOXR6Np</Encrypted>]]>
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9fNz2LNglS0iW5Xlq77UJ1R3g5TsPCvY+ptk1JCTMy7CNA/h34BzBrE6jAVoD1AXV5GS1/76qFGCChGxwxhFucVNQXNJibz+d3KP8C0BwCEISrOnVqt3MilSUYbmwglmnNJmOxz2tlQN65QuXEuRjlg=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezXcLimv/6KkhUsv6u9fREkTbFt7v4EchP/e4nVGoWZvkpzz3riEcF6TWzplFh7maRN7AhHUeDs2dSiN5RUfEBpUFnSEc64ArWRfdIdHN5dGU=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UkyML8OU9Vm+C05wYc54p6z6L6KitpBA61nxTxkORMtF3hTD7th5MHrh8wMLdOt69FWkIo9K63pJNMNrabLaHGfD7XYHEq2DHqfv7Xxr1ulF7DUf9lWWoBOZtq2dfXaC9Qp79/lul/Kr91uvKcHVJ0=</Encrypted>]]>
      &VoucherLogHandleStatusExplore;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmFeQqAuO58mRNaN/M3pDc4KJgEkzV7ps3Z0Erp+8gZScgORGM220HflsxuyRv1fjmY9JPJssTCsADMce7bUcSSC8jcPu1D4tGsZ0i3jq/GWM=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q97JImtt+Xw1HQpbeFFL8Zx3HDJdMup1q934HJhec6ZAQDpcqbwXE/7Xb5u/s1bL27bHdaYWXffZVySFV0Hp6z5pEMhEroza03Z7LuySR8fXlz42ANh8klKFi2dikc/SgYm7ikhZGBh4tQFS7kKa7H8f3ZB+YT1d8Xa1VUMDmpWYcArS9lNesPzXrSOtiJHOQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zxS2YYIX0wVoRprCceU/ifD+F3EscHLRI9HoBoWIG+JU6EFHrQ0pdjxOgFvTSR6P9sk8qG2yqS64uAvK2CIUClYEdWEAFf3hQhJTG3Ys5aPs4=</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>