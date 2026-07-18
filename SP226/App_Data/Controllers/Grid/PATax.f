<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY % UserDefinedFields SYSTEM "..\Include\XML\Config\Fields\PAGrid.ent">
  %UserDefinedFields;

  <!ENTITY XMLTaxFields SYSTEM "..\Include\XML\TaxFields.txt">
  <!ENTITY XMLTaxViews SYSTEM "..\Include\XML\TaxViews.txt">
  <!ENTITY XMLTaxResponse SYSTEM "..\Include\XML\TaxExecute.txt">
  <!ENTITY XMLWhenTaxLoading SYSTEM "..\Include\XML\GridTaxLoading.xml">
  <!ENTITY XMLWhenTaxClosing SYSTEM "..\Include\XML\WhenTaxClosing.xml">
  <!ENTITY ScriptTaxInit SYSTEM "..\Include\Javascript\TaxScript.txt">
  <!ENTITY ScriptTaxClose SYSTEM "..\Include\Javascript\TaxClose.txt">
  <!ENTITY XMLStandardDetailToolbar SYSTEM "..\Include\XML\StandardDetailToolbar.xml">

  <!ENTITY f ", t_tt: '[t_tt]:=[t_tien]+[t_thue]', t_tt_nt: '[t_tt_nt]:=[t_tien_nt]+[t_thue_nt]'">
]>

<grid table="r30$000000" code="stt_rec" order="stt_rec, line_nbr" type="Detail" freezeColumns="5" id="PNE" uniKey="true" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    &XMLTaxFields;
  </fields>

  <views>
    <view id="Grid">
      &XMLTaxViews;
    </view>
  </views>

  <commands>
    &XMLWhenTaxLoading;
    &XMLWhenTaxClosing;
  </commands>

  <script>
    <text>
      &ScriptTaxInit;&f;&ScriptTaxClose;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtdRv1YhR9e9Dl5cHVOOvzXwlPR6lInIRz6lvy+KaxUMWFgnHRDiz+suIiwIt0ZVG3FWQQW33JuvkRSOXwhmVVCcBA+ZRvD8PwBYErCYnDdAwMXab8DLxuS0k/0bl/W/3CmHBRDiRMS+hX94wDps5XSXnkxAmAYao4eXmQ8saKo/malGjPL1gLXpjLZXgyDGLaVb1hZelhQ4S4IlmMcItQ8wrWMLnkpWF77CkYRYxoAIdSMmxyY9B+m/xPP/TzYiE+j7W8+zzRjPV9uoHpAUwlaRHuukpLPy/owO9HKcQ2KNTcKB1ZwAfl0a1VOwZBxZ/S6fsFCu7GgQEreok8c9s7wWOT4jBfKPO0g0de37KPaXBq7vdlmbAgGJOYNtZXD/UczdqkeI7RPNXM3rLWsenTcP5REFdYJCnlI84DPX4RAyP6rMW3pygJ6mZkf9FGKx2cB5Pc444hAIlSEOY/xFz6HhWdSUNUnuOtP1uOvdVGJB5SejDlblGuqR5h4O5cAqAXpHDQR6BUBoJZOb5HhqE9cUaDfP2jxvB+rO4/ALKL3Hd1xg66ZSurujJVkIG1/ciZTtynbzIp4m+Ata7a05kIUH8vXPNj5qNvQ8A2pBOYdmn+8HMI+3SrsXsUpNV9Ws0dHx/bbytLKG0dBhxCBRKYRP/U3bmPbCyq8Fp1QOcKbvT</Encrypted>]]>
    </text>
  </script>

  <response>
    &XMLTaxResponse;
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3GFTo0MY5IGvjvYJHxN90t8EJEQOQ72Q3oUWy7eJDhm6OMQBPc3pYegPD9t5GyB7Ptps41W8ZQhjZxAtHeKDiZHtEtxwZnxpClar+Vl9OSjNMDXNuYBzzwuSpYyri+5uXHwXQx6TcHMlPj98KWNrUeXdXCvTiF+aC/8pHjm3kE4/BrSpWFCGiiACJssUSGFvoRJyRvfpSgYKBWnkXvkMes+4o3YP2Z4PVUZKp14tSxjleJKSekepuiQEQQ4bv03DK9GOQoasyr1hQ5YeYab6mYqadDT57l5DlogKW47oPEROljV7K0RxZnQRmw7IL7na6nMF7bh3KFXOGk28qJLPj6V5Fn7VNGcqekx3J6S4On0gzas5o5ip/cYztJ1TFUqT2553f3syCoSwczMxFfcFM+PrzhuK9YgC6FgQJX9Rm/8nHDVFoxRXTYcRJmZbJlOPw==</Encrypted>]]>
      </text>
    </query>
  </queries>

  &XMLStandardDetailToolbar;
</grid>